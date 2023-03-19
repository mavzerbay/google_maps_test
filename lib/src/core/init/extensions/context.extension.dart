import 'package:flutter/material.dart';

import '../../../view/_services/global_service.dart';
import '../../base/bloc/navigation_bloc.dart';
import '../dependency_injector.dart';

extension BlocExtension on BuildContext {
  NavigationBloc get navigationBloc =>
      DependencyInjector.instance.navigationBloc;

  IGlobalService get globalService => DependencyInjector.instance.globalService;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}
