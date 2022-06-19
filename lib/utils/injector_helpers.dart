import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:testing/data/data_sources/remote/fruit_api_service.dart';
import 'package:testing/data/repositories/fruit_repository_impl.dart';
import 'package:testing/domain/repositories/fruit_repository.dart';
import 'package:testing/domain/use_cases/get_fruit_use_case.dart';
import 'package:testing/feature/store/fruit_store.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Dio>(Dio());

  /// Fruit Feature
  injector.registerSingleton<FruitApiService>(FruitApiService(injector()));

  injector.registerSingleton<FruitRepository>(FruitRepositoryImpl(injector()));

  injector.registerSingleton<GetFruitUseCase>(
    GetFruitUseCase(injector()),
  );

  injector.registerSingleton<FruitStore>(
    FruitStore(injector()),
    instanceName: 'FruitStore',
  );

  /// End of Fruit Feature
}
