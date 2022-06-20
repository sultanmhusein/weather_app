import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/injection.dart' as di;
import 'package:weather_app/presentations/cubit/weather_cubit.dart';
import 'package:weather_app/shared/bloc_observer.dart';

import 'presentations/pages/app.dart';

void main() {
  di.init();
  BlocOverrides.runZoned(() {
    runZonedGuarded(() {
      runApp(MultiBlocProvider(providers: [
        BlocProvider(create: (context) => di.locator<WeatherCubit>()),
      ], child: MyApp()));
    }, (error, stackTrace) {});
  }, blocObserver: Observer());
}
