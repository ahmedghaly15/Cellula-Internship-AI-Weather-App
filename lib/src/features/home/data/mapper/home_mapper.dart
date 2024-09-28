import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_current_response.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_current_entity.dart';

class HomeMapper {
  HomeMapper._();

  static FetchCurrentEntity toCurrentEntity(
    FetchCurrentResponse currentResponse,
  ) {
    return FetchCurrentEntity(
      city: currentResponse.location!.name!,
      tempC: currentResponse.current!.tempC!,
      condition: currentResponse.current!.condition!,
      windDegree: currentResponse.current!.windDegree!,
      humidity: currentResponse.current!.humidity!,
      cloud: currentResponse.current!.cloud!,
      heatIndexC: currentResponse.current!.heatIndexC!,
    );
  }
}
