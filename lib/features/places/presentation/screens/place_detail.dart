import 'package:auto_route/auto_route.dart';
import 'package:favorite_places/assets/colors.dart';
import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/core/di/injection.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(children: [
              GestureDetector(  
                  onTap: (){
                    getIt<AppRouter>().push(MapsRoute(locationEntity: place.location, isSelecting: false));
                  },
                  child: CircleAvatar(
                radius: 70,
                backgroundImage:
                    NetworkImage(place.location.googleStaticMapsUri),
              )),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColor.topBoxTransparent,
                    AppColor.bottomBoxTransparent,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  place.location.address,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
