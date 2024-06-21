import 'package:dio/dio.dart';
import 'package:favorite_places/config/routes/app_router.dart';
import 'package:favorite_places/features/places/data/data_sources/local/database.dart';
import 'package:favorite_places/features/places/data/data_sources/remote/location_api_service.dart';
import 'package:favorite_places/features/places/data/network/dio_interceptor.dart';
import 'package:favorite_places/features/places/data/repository/places_repository_impl.dart';
import 'package:favorite_places/features/places/domain/repository_contracts/places_repository.dart';
import 'package:favorite_places/features/places/domain/usecases/get_location.dart';
import 'package:favorite_places/features/places/domain/usecases/local_db_delete_place.dart';
import 'package:favorite_places/features/places/domain/usecases/local_db_get_all_places.dart';
import 'package:favorite_places/features/places/domain/usecases/local_db_save_place.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  Dio dio = Dio();
  dio.interceptors.add(DioInterceptor());
  getIt.registerSingleton<Dio>(dio); 

  //dependencies
  getIt.registerSingleton<LocationApiService>(LocationApiService(getIt()));

  getIt.registerSingleton<AppDatabase>(AppDatabase());

  getIt.registerSingleton<PlacesRepository>(PlacesRepositoryImpl(getIt(), getIt()));

  getIt.registerSingleton<AppRouter>(AppRouter());

  
  //use cases
  getIt.registerSingleton<GetLocationUseCase>(GetLocationUseCase(getIt()));
  getIt.registerSingleton<LocalDbGetAllPlaceUseCase>(LocalDbGetAllPlaceUseCase(getIt()));
  getIt.registerSingleton<LocalDbSaveNewPlaceUseCase>(LocalDbSaveNewPlaceUseCase(getIt()));
  getIt.registerSingleton<LocalDbDeletePlaceUseCase>(LocalDbDeletePlaceUseCase(getIt()));


  //blocs
   //getIt.registerSingleton<LocationBloc>(LocationBloc(getIt()));
   //getIt.registerFactory<LocationBloc>(() => LocationBloc(getIt()));

}
