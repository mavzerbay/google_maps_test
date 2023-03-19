import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_task/src/core/base/app_bloc_observer.dart';
import 'package:mobile_task/src/core/init/routes/route_keys.dart';

import 'src/core/init/dependency_injector.dart';
import 'src/core/init/routes/routes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver.instance;
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: DependencyInjector.instance.blocProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFF00004E),
          buttonTheme: const ButtonThemeData().copyWith(
            buttonColor: const Color(0xFF00004E),
            textTheme: ButtonTextTheme.primary,
            colorScheme: const ColorScheme.light().copyWith(
              primary: const Color(0xFF00004E),
            ),
          ),
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color(0xFF00004E),
          ),
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteKeys.splash,
        navigatorKey: DependencyInjector.instance.navigatorKey,
      ),
    );
  }
}
