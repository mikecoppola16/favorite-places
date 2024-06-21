import 'package:favorite_places/assets/strings.dart';
import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/core/di/injection.dart';
import 'package:favorite_places/core/ui/decoration/box.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';
import 'package:favorite_places/features/places/presentation/bloc/remote/location_bloc.dart';
import 'package:favorite_places/features/places/presentation/bloc/remote/location_event.dart';
import 'package:favorite_places/features/places/presentation/bloc/remote/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onPickedLocation});

  final Function(LocationEntity placeLocation) onPickedLocation;

  @override
  State<StatefulWidget> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  void getCurrentLocation() {
    context.read<LocationBloc>().add(const GetLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: boxWithBorder(context),
        alignment: Alignment.center,
        height: 170,
        width: double.infinity,
        child: _locationBloc(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.location_on),
            label: const Text(AppString.getLocation),
            onPressed: () {
              getCurrentLocation();
            },
          ),
          TextButton.icon(
            icon: const Icon(Icons.map),
            label: const Text(AppString.selectOnMap),
            onPressed: () async{
              LatLng latLng  = await getIt<AppRouter>().push(MapsRoute(isSelecting: true)) as LatLng;
              if (!context.mounted) return;
              context.read<LocationBloc>().add(GetLocationHaveLatLng(latlng: latLng));
            },
          )
        ],
      )
    ]);
  }

  _locationBloc() {
    return BlocBuilder<LocationBloc, LocationState>(builder: (ctx, state) {
      if (state is LocationNotInitiated) {
        return _locationInfoText(AppString.noLocationChosen);
      } else if (state is LocationLoading) {
        return const CircularProgressIndicator();
      } else if (state is GetLocationError) {
        return _locationInfoText(AppString.getLocationError);
      } else if (state is LocationServiceNotEnabled) {
        return _locationInfoText(AppString.locationServiceNotEnabledError);
      } else if (state is PermissionNotGranted) {
        return _locationInfoText(AppString.permissionError);
      } else if (state is GetLocationSuccess) {
        return _populateMap(state.locationEntity);
      }
      return const Column();
    });
  }

  _populateMap(LocationEntity locationEntity) {
   
    widget.onPickedLocation(locationEntity);

    return Image.network(
      locationEntity.googleStaticMapsUri,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  _locationInfoText(String infoText) {
    return Text(
      infoText,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
