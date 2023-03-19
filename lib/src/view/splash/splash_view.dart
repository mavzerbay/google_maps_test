import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_task/src/core/init/extensions/asset.extension.dart';
import 'package:mobile_task/src/core/init/routes/route_keys.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteKeys.home,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("loader".toLottie),
      ),
    );
  }
}
