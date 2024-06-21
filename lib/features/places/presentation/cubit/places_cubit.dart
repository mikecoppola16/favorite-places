import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/presentation/cubit/places_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesCubit extends Cubit<PlaceState> {
  List<PlaceEntity> listPlaces = [];

  PlacesCubit() : super(PlaceStateEmpty());

  addAllPlaces( List<PlaceEntity> places) {
     listPlaces = places;
  }

  addPlace(PlaceEntity place) {
    listPlaces.add(place);
     emit(PlaceStateAddNew(places: listPlaces));
  }
}
