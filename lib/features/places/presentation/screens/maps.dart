import 'package:auto_route/auto_route.dart';
import 'package:favorite_places/assets/strings.dart';
import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/core/constants/constants.dart';
import 'package:favorite_places/core/di/injection.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class MapsScreen extends StatefulWidget {
  const MapsScreen(
      {super.key,
      this.locationEntity = const LocationEntity(
          id: 0,
          latitude: GOOGLE_LATTTUDE,
          longitude: GOOGLE_LONGITUDE,
          googleStaticMapsUri: "",
          address: "",),
      this.isSelecting = true});

  final LocationEntity locationEntity;
  final bool isSelecting;

  @override
  State<StatefulWidget> createState() {
    return _MapsScreenState();
  }
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting
            ? AppString.pickLocation
            : AppString.yourLocation),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                if(_pickedLocation == null) {
                  return;
                }
                getIt<AppRouter>().maybePop(_pickedLocation);
              },
            )
        ],
      ),
      body: GoogleMap(
        onTap: (latLng) {
          setState(() {
            _pickedLocation = latLng;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.locationEntity.latitude,
            widget.locationEntity.longitude,
          ),
          zoom: 16,
        ),
        markers: ( _pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                    markerId: const MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(
                          widget.locationEntity.latitude,
                          widget.locationEntity.longitude,
                        ))
              },
      ),
    );
  }
}
