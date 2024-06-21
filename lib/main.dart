import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/config/theme/theme.dart';
import 'package:favorite_places/core/di/injection.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_bloc.dart';
import 'package:favorite_places/features/places/presentation/bloc/local/place_db_event.dart';
import 'package:favorite_places/features/places/presentation/bloc/remote/location_bloc.dart';
import 'package:favorite_places/features/places/presentation/cubit/places_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();

  //Bloc.observer = GlobalBlocObserver();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PlacesCubit()),
          BlocProvider(create: (context) => LocationBloc(getIt())),
          BlocProvider(create: (context) => LocalDbBloc(getIt(),getIt(),getIt())..add(const GetPLacesFromLocalDb())),
        ],
        child: MaterialApp.router(
          title: 'Great Places',
          theme: AppTheme.darkTheme,
          routerConfig: _appRouter.config(),
        ));
  }
}
