import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/components/platform_loader.dart';
import '../../core/init/extensions/context.extension.dart';
import '../_models/pharmacy.model.dart';
import '../home/bloc/home_bloc.dart';
import 'bloc/pharmacy_bloc.dart';

// ignore: must_be_immutable
class PharmacyView extends StatefulWidget {
  const PharmacyView({
    Key? key,
  }) : super(key: key);

  @override
  State<PharmacyView> createState() => _PharmacyViewState();
}

class _PharmacyViewState extends State<PharmacyView> {
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
        title: const Text("Nöbetçi Eczaneler"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          if (homeState is HomeCurrentLocationLoaded) {
            return BlocProvider(
              create: (context) => PharmacyBloc(context.globalService)
                ..add(PharmaciesLoadEvent()),
              child: BlocListener<PharmacyBloc, PharmacyState>(
                listener: (context, state) {
                  if (state is PharmacyError) {
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
                child: BlocBuilder<PharmacyBloc, PharmacyState>(
                  builder: (context, pharmacyState) {
                    if (pharmacyState is PharmacyLoaded) {
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
                          pharmacyState.pharmacies
                              .map(
                                (pharmacy) => Marker(
                                  markerId: MarkerId(
                                      "${pharmacy.lokasyonX}_${pharmacy.lokasyonY}"),
                                  position: LatLng(
                                    double.parse(pharmacy.lokasyonX!),
                                    double.parse(pharmacy.lokasyonY!),
                                  ),
                                  infoWindow: InfoWindow(
                                    title: pharmacy.adi,
                                    snippet: pharmacy.adres,
                                    onTap: () {
                                      developer.log("Info window tapped");
                                      _onMarkerTapped(pharmacy);
                                    },
                                  ),
                                  icon: pharmacyState.pharmacyIcon,
                                  onTap: () {
                                    developer.log("Marker tapped");
                                    _onMarkerTapped(pharmacy);
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

  _onMarkerTapped(PharmacyModel pharmacy) {
    developer.log("Marker tapped");

    if (Platform.isAndroid) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            height: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  pharmacy.adi!,
                  style: context.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                Text(
                  pharmacy.adres!,
                  style: context.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  pharmacy.bolgeAciklama!,
                  style: context.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        developer.log("Phone button pressed");

                        final launcUri =
                            Uri(scheme: 'tel', path: pharmacy.telefon!);

                        if (await canLaunchUrl(launcUri)) {
                          await launchUrl(launcUri);
                        } else {
                          developer.log("Can't launch url");
                        }
                      },
                      child: const Icon(Icons.phone),
                    ),
                    Text(
                      pharmacy.telefon!,
                      style: context.textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    developer.log("Navigate button pressed");
                    Navigator.of(context).pop();
                  },
                  child: const Text("Tamam"),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text(pharmacy.adi!, style: context.textTheme.headline6),
          message: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pharmacy.adres!,
                style: context.textTheme.bodyText1,
              ),
              const SizedBox(height: 10),
              Text(
                pharmacy.bolgeAciklama!,
                style: context.textTheme.bodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      developer.log("Phone button pressed");

                      final launcUri =
                          Uri(scheme: 'tel', path: pharmacy.telefon!);

                      if (await canLaunchUrl(launcUri)) {
                        await launchUrl(launcUri);
                      } else {
                        developer.log("Can't launch url");
                      }
                    },
                    child: const Icon(Icons.phone),
                  ),
                  Text(
                    pharmacy.telefon!,
                    style: context.textTheme.bodyText1,
                  ),
                ],
              )
            ],
          ),
          actions: [
            CupertinoActionSheetAction(
              child: const Text("Tamam"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
