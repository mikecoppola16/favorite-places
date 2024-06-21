// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddNewPlaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddNewPlaceScreen(),
      );
    },
    MapsRoute.name: (routeData) {
      final args =
          routeData.argsAs<MapsRouteArgs>(orElse: () => const MapsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapsScreen(
          key: args.key,
          locationEntity: args.locationEntity,
          isSelecting: args.isSelecting,
        ),
      );
    },
    PlaceDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaceDetailScreen(
          key: args.key,
          place: args.place,
        ),
      );
    },
    PlacesHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacesHomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AddNewPlaceScreen]
class AddNewPlaceRoute extends PageRouteInfo<void> {
  const AddNewPlaceRoute({List<PageRouteInfo>? children})
      : super(
          AddNewPlaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNewPlaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapsScreen]
class MapsRoute extends PageRouteInfo<MapsRouteArgs> {
  MapsRoute({
    Key? key,
    LocationEntity locationEntity = const LocationEntity(
        id: 0,
        latitude: GOOGLE_LATTTUDE,
        longitude: GOOGLE_LONGITUDE,
        googleStaticMapsUri: "",
        address: ""),
    bool isSelecting = true,
    List<PageRouteInfo>? children,
  }) : super(
          MapsRoute.name,
          args: MapsRouteArgs(
            key: key,
            locationEntity: locationEntity,
            isSelecting: isSelecting,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const PageInfo<MapsRouteArgs> page = PageInfo<MapsRouteArgs>(name);
}

class MapsRouteArgs {
  const MapsRouteArgs({
    this.key,
    this.locationEntity = const LocationEntity(
        id: 0,
        latitude: GOOGLE_LATTTUDE,
        longitude: GOOGLE_LONGITUDE,
        googleStaticMapsUri: "",
        address: ""),
    this.isSelecting = true,
  });

  final Key? key;

  final LocationEntity locationEntity;

  final bool isSelecting;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key, locationEntity: $locationEntity, isSelecting: $isSelecting}';
  }
}

/// generated route for
/// [PlaceDetailScreen]
class PlaceDetailRoute extends PageRouteInfo<PlaceDetailRouteArgs> {
  PlaceDetailRoute({
    Key? key,
    required PlaceEntity place,
    List<PageRouteInfo>? children,
  }) : super(
          PlaceDetailRoute.name,
          args: PlaceDetailRouteArgs(
            key: key,
            place: place,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaceDetailRoute';

  static const PageInfo<PlaceDetailRouteArgs> page =
      PageInfo<PlaceDetailRouteArgs>(name);
}

class PlaceDetailRouteArgs {
  const PlaceDetailRouteArgs({
    this.key,
    required this.place,
  });

  final Key? key;

  final PlaceEntity place;

  @override
  String toString() {
    return 'PlaceDetailRouteArgs{key: $key, place: $place}';
  }
}

/// generated route for
/// [PlacesHomeScreen]
class PlacesHomeRoute extends PageRouteInfo<void> {
  const PlacesHomeRoute({List<PageRouteInfo>? children})
      : super(
          PlacesHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacesHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
