import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:favorite_places/assets/strings.dart';
import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/core/di/injection.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';
import 'package:favorite_places/features/places/presentation/cubit/places_cubit.dart';
import 'package:favorite_places/features/places/presentation/widgets/image_input.dart';
import 'package:favorite_places/features/places/presentation/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddNewPlaceScreen extends StatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  State<AddNewPlaceScreen> createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  final formKey = GlobalKey<FormState>();
  var placeTitle = '';
  File? pickedImage;
  LocationEntity? pickedLocation;

  void _saveForm() {
    if (formKey.currentState?.validate() == true && pickedImage != null && pickedLocation != null) {
      formKey.currentState?.save();
      getIt<AppRouter>().maybePop(  PlaceEntity(id: 0, location: pickedLocation!, title: placeTitle, image: pickedImage!)  );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.addNewPLace),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 25,
                  decoration: const InputDecoration(label: Text(AppString.title)),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length == 1) {
                      return AppString.titleError;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    placeTitle = value!;
                  },
                ),
                ImageInput(
                  onPickImage: (File? image) {
                    pickedImage = image;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                LocationInput(
                  onPickedLocation: (LocationEntity location){
                      pickedLocation = location;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      _saveForm();
                    },
                    label: const Text(AppString.addPlace))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
