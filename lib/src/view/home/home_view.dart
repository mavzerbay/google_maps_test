import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
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
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeCurrentLocationGet()),
      child: Scaffold(
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeCurrentLocationError) {
              Platform.isIOS
                  ? showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                            title: Text(
                              state.message,
                              style: context.textTheme.headline6!
                                  .copyWith(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () {
                                  Geolocator.openLocationSettings();
                                },
                                child: const Text('İzin Ver'),
                              ),
                            ],
                          ))
                  : showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              state.message,
                              style: context.textTheme.headline6!
                                  .copyWith(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await Geolocator.openLocationSettings();
                                  if (mounted) {
                                    context
                                        .watch<HomeBloc>()
                                        .add(HomeCurrentLocationGet());
                                  }
                                },
                                child: const Text('İzin Ver'),
                              ),
                            ],
                          ),
                      useSafeArea: true);
            }
          },
          child: currentScreen,
        ),
        bottomNavigationBar: BlocProvider(
          create: (context) => context.navigationBloc,
          child: BlocListener<NavigationBloc, int>(
            listener: (context, state) async {
              if (mounted) {
                final hasPermission = await Geolocator.checkPermission();

                if ((hasPermission == LocationPermission.denied ||
                        hasPermission == LocationPermission.deniedForever) &&
                    mounted) {
                  context.read<HomeBloc>().add(HomeCurrentLocationGet());
                }

                setState(() {
                  currentScreen = _pageChooser(state);
                });
              }
            },
            child: const CustomBottomBar(),
          ),
        ),
      ),
    );
  }
}
