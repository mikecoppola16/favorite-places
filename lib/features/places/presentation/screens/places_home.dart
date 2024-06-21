import 'package:auto_route/auto_route.dart';
import 'package:favorite_places/assets/strings.dart';
import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/core/di/injection.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_bloc.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_event.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_state.dart';
import 'package:favorite_places/features/places/presentation/widgets/places_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PlacesHomeScreen extends StatefulWidget {
  const PlacesHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlacesHomeState();
  }
}

class _PlacesHomeState extends State<PlacesHomeScreen> {
  showNewItemForm() async {
    var newPlaceTemp = await getIt<AppRouter>().push(const AddNewPlaceRoute());

    if (newPlaceTemp == null) {
      return;
    }

    if (!context.mounted) return;
    context
        .read<LocalDbBloc>()
        .add(SavePlaceToLocalDb(newPlace: newPlaceTemp as PlaceEntity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppString.appTitle), actions: [
        IconButton(
            onPressed: () {
              showNewItemForm();
            },
            icon: const Icon(Icons.add)),
      ]),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<LocalDbBloc, LocalDbPlacesState>(
        builder: (context, state) {
      if (state is LocalDBLoading) {
        return _circularProgress();
      }
      if (state is GetPlacesFromLocalDBEmpty) {
        return _noPlacesInfo(AppString.noPlacesAdded);
      } else if (state is LocalDbError) {
        _showActionFailedSnackBar(state.error);
        return _placesListView(state.places);
      } else if (state is GetAllPlacesFromLocalDBSuccess) {
        return _placesListView(state.places);
      } else if (state is SavePlaceToLocalDBSuccess) {
        return _placesListView(state.places);
      } else if (state is DeletePlaceFromLocalDBError) {
        //if we fail to delete from local db , we need to restore item that was swiped away
        _showActionFailedSnackBar(AppString.dbDeletePlaceFailed);
        return _placesListView(state.places);
      }

      return _noPlacesInfo(AppString.noPlacesAdded);
    });
  }

  _circularProgress() {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: const CircularProgressIndicator(),
    );
  }

  _noPlacesInfo(String text) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        AppString.noPlacesAdded,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }

  _placesListView(List<PlaceEntity> places) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: ValueKey(places.elementAt(index).id),
        background:
            Container(color: Theme.of(context).colorScheme.errorContainer),
        onDismissed: (direction) {
          _onRemovePlace(places.elementAt(index));
        },
        child: GestureDetector(
          child: PlacesItem(ctx: context, placeModel: places.elementAt(index)),
          onTap: () => getIt<AppRouter>().push(
            PlaceDetailRoute(place: places.elementAt(index)),
          ),
        ),
      ),
    );
  }

  _onRemovePlace(PlaceEntity placeToRemove) {
    context
        .read<LocalDbBloc>()
        .add(DeletePlaceFromLocalDb(place: placeToRemove));
  }

  _showActionFailedSnackBar(final String text) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 7),
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          content: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onErrorContainer),
          ),
        ),
      );
    });
  }
}
