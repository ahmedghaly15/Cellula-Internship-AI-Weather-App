abstract class ForecastEvent {}

final class FetchForecastEvent extends ForecastEvent {
  final String city;

  FetchForecastEvent(this.city);
}

final class UpdateSelectedDayEvent extends ForecastEvent {
  final int selectedDay;

  UpdateSelectedDayEvent(this.selectedDay);
}
