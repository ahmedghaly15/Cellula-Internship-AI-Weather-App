import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/entities/fetch_forecast_entity.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/city_and_country_and_current_button.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/condition_text.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/days_list_view_bloc_builder.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/labeled_circular_percent_indicators.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/weather_image.dart';

class FetchForecastSuccessWidget extends StatelessWidget {
  const FetchForecastSuccessWidget({
    super.key,
    required this.forecastEntity,
  });

  final FetchForecastEntity forecastEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CityAndCountryAndCurrentButton(
            city: forecastEntity.city,
            country: forecastEntity.country,
            current: forecastEntity.current,
          ),
        ),
        SliverToBoxAdapter(
          child: DaysListViewBlocBuilder(
            forecastDays: forecastEntity.forecast.forecastDays,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<ForecastBloc, ForecastState>(
            buildWhen: (_, current) => current is UpdatedSelectedDay,
            builder: (context, __) => ConditionText(
              condition: forecastEntity.forecast.forecastDays
                  .elementAt(context.read<ForecastBloc>().selectedDay)
                  .day
                  .condition
                  .text!,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<ForecastBloc, ForecastState>(
            buildWhen: (_, current) => current is UpdatedSelectedDay,
            builder: (context, _) => LabeledCircularPercentIndicators(
              attributes:
                  context.read<ForecastBloc>().forecastIndicatorsAttributes(
                        forecastEntity.forecast.forecastDays,
                      ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<ForecastBloc, ForecastState>(
            buildWhen: (_, current) => current is UpdatedSelectedDay,
            builder: (context, __) => WeatherImage(
              imageUrl: forecastEntity.forecast.forecastDays
                  .elementAt(context.read<ForecastBloc>().selectedDay)
                  .day
                  .condition
                  .icon!,
            ),
          ),
        ),
      ],
    );
  }
}
