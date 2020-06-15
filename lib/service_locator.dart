import 'package:get_it/get_it.dart';
import 'package:spacex_flights/src/blocs/flights_bloc.dart';
import 'package:spacex_flights/src/resources/flight_provider.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

final getIt = GetIt.instance;

void registerServices({bool testing = false}) {
  getIt.reset();
  getIt.registerLazySingleton(() => FlightProvider());
  getIt.registerLazySingleton(() => FlightsBloc());

  if (!testing) {
    getIt.registerLazySingleton<http.Client>(() => Client());
  } else {
    getIt.registerLazySingleton<http.Client>(() => MockClient());
  }
}

class MockClient extends Mock implements http.Client {}
