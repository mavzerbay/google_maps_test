import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/bloc/navigation_bloc.dart';

import '../../../core/init/extensions/context.extension.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.navigationBloc,
      child: BlocBuilder<NavigationBloc, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state,
            onTap: (value) => context.navigationBloc.add(value),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Anasayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_pharmacy_rounded),
                label: "Nöbetçi Eczaneler",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bus_alert_rounded),
                label: "Duraklar",
              ),
            ],
          );
        },
      ),
    );
  }
}
