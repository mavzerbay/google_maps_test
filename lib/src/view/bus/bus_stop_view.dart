import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/components/platform_loader.dart';
import '../../core/init/routes/route_keys.dart';

import '../../core/init/extensions/context.extension.dart';
import '../home/bloc/home_bloc.dart';
import 'blocs/bus_stop/bus_stop_bloc.dart';

class BusStopView extends StatefulWidget {
  const BusStopView({super.key});

  @override
  State<BusStopView> createState() => _BusStopViewState();
}

class _BusStopViewState extends State<BusStopView> {
  GoogleMapController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yakın Duraklar"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          if (homeState is HomeCurrentLocationLoaded) {
            return BlocProvider(
              create: (context) => BusStopBloc(context.globalService)
                ..add(BusGetBusStops(homeState.currentLocation)),
              child: BlocListener<BusStopBloc, BusStopState>(
                listener: (context, state) {
                  if (state is BusError) {
                    developer.log(state.error.toString());
                    if (Platform.isAndroid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error.toString()),
                        ),
                      );
                    } else {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: const Text("Error"),
                          content: Text(state.error.toString()),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text("OK"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: BlocBuilder<BusStopBloc, BusStopState>(
                  builder: (context, busState) {
                    if (busState is BusLoaded) {
                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: homeState.currentLocation,
                          zoom: 16.4746,
                        ),
                        onMapCreated: (controller) {
                          developer.log("Map created");
                          _controller = controller;
                        },
                        markers: Set<Marker>.of(
                          busState.busStops
                              .map(
                                (busStop) => Marker(
                                  markerId: MarkerId(
                                      "${busStop.koorX}_${busStop.koorY}"),
                                  position: LatLng(
                                    busStop.koorX!,
                                    busStop.koorY!,
                                  ),
                                  infoWindow: InfoWindow(
                                    title: "${busStop.adi} - ${busStop.id}",
                                    snippet:
                                        "${busStop.mesafe!.round()} m uzaklıkta",
                                    onTap: () {
                                      developer.log("Info window tapped");
                                      Navigator.pushNamed(
                                        context,
                                        RouteKeys.busStopDetail,
                                        arguments: busStop.gecenHatlar,
                                      );
                                    },
                                  ),
                                  icon: busState.busStop,
                                  onTap: () {
                                    developer.log("Marker tapped");
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                      );
                    }
                    return const PlatformLoader();
                  },
                ),
              ),
            );
          }

          return const PlatformLoader();
        },
      ),
    );
  }
}
