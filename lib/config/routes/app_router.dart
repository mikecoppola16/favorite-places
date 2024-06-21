import 'package:auto_route/auto_route.dart';
import 'package:favorite_places/core/constants/constants.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';
import 'package:favorite_places/features/places/presentation/screens/add_new_place.dart';
import 'package:favorite_places/features/places/presentation/screens/maps.dart';
import 'package:favorite_places/features/places/presentation/screens/place_detail.dart';
import 'package:favorite_places/features/places/presentation/screens/places_home.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PlacesHomeRoute.page, initial: true),
        AutoRoute(page: AddNewPlaceRoute.page),
        AutoRoute(page: PlaceDetailRoute.page),
        AutoRoute(page: MapsRoute.page),
        
      ];
}
