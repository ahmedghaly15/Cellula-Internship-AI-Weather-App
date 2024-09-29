abstract class ForecastEvent {}

final class FetchForecastEvent extends ForecastEvent {
  final String city;

  FetchForecastEvent(this.city);
}
