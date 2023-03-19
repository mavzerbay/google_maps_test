import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../view/_services/global_service.dart';
import '../base/bloc/navigation_bloc.dart';
import 'network/vexana_manager.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final GlobalKey<NavigatorState> navigatorKey;

  late final INetworkManager networkManager;
  late final IGlobalService globalService;
  late final NavigationBloc navigationBloc;

  DependencyInjector._init() {
    navigatorKey = GlobalKey<NavigatorState>(
      debugLabel: 'MainNavigator',
    );

    navigationBloc = NavigationBloc();

    networkManager = VexanaManager.instance.networkManager;
    globalService = GlobalService(networkManager);
  }

  List<BlocProvider> get blocProviders => [
        BlocProvider(create: (context) => navigationBloc),
      ];
}
