import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentations/pages/app.dart';
import 'package:weather_app/shared/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(() {
    runZonedGuarded(() {
      runApp(MyApp());
    }, (error, stackTrace) {});
  }, blocObserver: Observer());
}
