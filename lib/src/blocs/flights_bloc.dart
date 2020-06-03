import 'package:rxdart/rxdart.dart';
import 'package:spacex_flights/src/models/flights.dart';
import 'package:spacex_flights/src/resources/repository.dart';

class FlightsBloc {
  final _repository = Repository();
  final _flightsFetcher = ReplaySubject<Flights>();

  Stream<Flights> get flights => _flightsFetcher.stream;

  fetchAllFlights() async {
    Flights flights = await _repository.fetchAllFlights();
    _flightsFetcher.sink.add(flights);
  }

  dispose() {
    _flightsFetcher.close();
  }
}

final bloc = FlightsBloc();