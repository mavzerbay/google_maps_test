import 'package:flutter/material.dart';

import '../../../view/_models/bus.model.dart';
import '../../../view/bus/bus_detail_view.dart';
import '../../../view/bus/bus_stop_detail_view.dart';
import '../../../view/bus/bus_stop_view.dart';
import '../../../view/home/home_view.dart';
import '../../../view/pharmacy/pharmacy_view.dart';
import '../../../view/splash/splash_view.dart';
import 'route_keys.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteKeys.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );
      case RouteKeys.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
          settings: settings,
        );
      case RouteKeys.pharmacy:
        return MaterialPageRoute(
          builder: (_) => const PharmacyView(),
          settings: settings,
        );
      case RouteKeys.busStop:
        return MaterialPageRoute(
          builder: (_) => const BusStopView(),
          settings: settings,
        );
      case RouteKeys.busStopDetail:
        final busStop = settings.arguments as List<BusModel>;
        return MaterialPageRoute(
          builder: (_) => BusStopDetailView(busStops: busStop),
          fullscreenDialog: true,
          settings: settings,
        );
      case RouteKeys.busLineDetail:
        return MaterialPageRoute(
          builder: (_) => BusDetailView(
            lineNo: settings.arguments as String,
          ),
          fullscreenDialog: true,
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
