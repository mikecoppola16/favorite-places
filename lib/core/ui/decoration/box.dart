import 'package:flutter/material.dart';

BoxDecoration boxWithBorder(BuildContext context) {
  return BoxDecoration(
      border: Border.all(
    width: 1,
    color: Theme.of(context).colorScheme.primary.withOpacity(.5),
  ));
}
