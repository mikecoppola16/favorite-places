// ignore_for_file: void_checks, prefer_is_empty

import 'dart:ffi';
import 'package:favorite_places/features/places/data/mappers/local/db_place_entity_to_model.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/domain/usecases/local_db_delete_place.dart';
import 'package:favorite_places/features/places/domain/usecases/local_db_get_all_places.dart';
import 'package:favorite_places/features/places/domain/usecases/local_db_save_place.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_event.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalDbBloc extends Bloc<LocalDbEvent, LocalDbPlacesState> {
  final LocalDbGetAllPlaceUseCase _localDbGetAllPlaceUseCase;
  final LocalDbSaveNewPlaceUseCase _localDbGSaveNewPlaceUseCase;
  final LocalDbDeletePlaceUseCase _localDbDeletePlaceUseCase;

  List<PlaceEntity>? runningListAllPlaces;

  LocalDbBloc(this._localDbGetAllPlaceUseCase,
      this._localDbGSaveNewPlaceUseCase, this._localDbDeletePlaceUseCase)
      : super(const LocalDBLoading()) {
    on<GetPLacesFromLocalDb>((event, emit) async {
      final dataState = await _localDbGetAllPlaceUseCase.execute(Void);

      if (dataState.isLeft) {
        emit(LocalDbError(error: dataState.left.error, places: const []));
      } else {
        var listPlaces = dataState.right;
        if (listPlaces.isEmpty) {
          emit(const GetPlacesFromLocalDBEmpty());
        } else {
          emit(GetAllPlacesFromLocalDBSuccess(places: dataState.right));
        }
      }
    });
    on<SavePlaceToLocalDb>((event, emit) async {
      runningListAllPlaces = state.allplaces;

      emit(const LocalDBLoading());

      final dataState = await _localDbGSaveNewPlaceUseCase
          .execute(DbPlaceEntityToModel.map(event.newPlace));

      if (dataState.isLeft) {
        emit(LocalDbError(
            error: dataState.left.error, places: runningListAllPlaces!));
      } else {
        if (runningListAllPlaces == null) {
          runningListAllPlaces = [dataState.right];
        } else {
          runningListAllPlaces?.insert(0, dataState.right);
        }
        emit(SavePlaceToLocalDBSuccess(places: runningListAllPlaces!));
      }
    });

    on<DeletePlaceFromLocalDb>((event, emit) async {
      runningListAllPlaces = state.allplaces;
      var placeToDelete = event.place;

      emit(const LocalDBLoading());

      await Future.delayed(const Duration(milliseconds: 300));

      final dataState = await _localDbDeletePlaceUseCase
          .execute(DbPlaceEntityToModel.map(placeToDelete));

      if (dataState.isLeft) {
        emit(LocalDbError(
            error: dataState.left.error, places: runningListAllPlaces!));
      } else {
        runningListAllPlaces
            ?.removeWhere((item) => item.id == placeToDelete.id);

        emit(SavePlaceToLocalDBSuccess(places: runningListAllPlaces!));
      }
    });
  }
}
