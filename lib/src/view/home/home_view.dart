import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_task/src/view/home/bloc/home_bloc.dart';
import '../bus/bus_stop_view.dart';
import 'package:mobile_task/src/view/pharmacy/pharmacy_view.dart';

import '../../core/base/bloc/navigation_bloc.dart';
import '../../core/init/extensions/context.extension.dart';
import 'components/custom_bottom_bar.dart';
import 'pages/personal_information.page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget _pageChooser(page) {
    switch (page) {
      case 0:
        return const PersonalInformationPage();
      case 1:
        return const PharmacyView();
      case 2:
        return const BusStopView();
      default:
        return const PersonalInformationPage();
    }
  }

  Widget currentScreen = const PersonalInformationPage();

  @override
  void initState() {
    _pageChooser(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeCurrentLocationGet()),
        child: currentScreen,
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => context.navigationBloc,
        child: BlocListener<NavigationBloc, int>(
          listener: (context, state) {
            if (mounted) {
              setState(() {
                currentScreen = _pageChooser(state);
              });
            }
          },
          child: const CustomBottomBar(),
        ),
      ),
    );
  }
}
