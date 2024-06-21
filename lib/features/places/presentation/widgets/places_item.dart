import 'dart:io';

import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:flutter/material.dart';

class PlacesItem extends ListTile {
  const PlacesItem(
      {super.key,
      required this.ctx,
      required this.placeModel,
      });

  final BuildContext ctx;
  final PlaceEntity placeModel;

  @override
  Widget? get leading => CircleAvatar(
        radius: 22,
        backgroundImage: FileImage(placeModel.image!),
      );

  @override
  Widget? get title => Text(placeModel.title,
      style: Theme.of(ctx)
          .textTheme
          .titleMedium
          ?.copyWith(color: Theme.of(ctx).colorScheme.onSurface));

  @override
  Widget? get subtitle => Text(placeModel.location!.address);
}
