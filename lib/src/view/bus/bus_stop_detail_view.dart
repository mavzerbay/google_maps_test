import 'package:flutter/material.dart';

import '../../core/init/routes/route_keys.dart';
import '../_models/bus.model.dart';

class BusStopDetailView extends StatelessWidget {
  final List<BusModel> busStops;
  const BusStopDetailView({super.key, required this.busStops});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geçen Hatlar"),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: busStops.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, RouteKeys.busLineDetail,
                  arguments: "${busStops[index].hatNo}");
            },
            leading: const SizedBox(
              height: double.infinity,
              child: Icon(Icons.directions_bus),
            ),
            title: Text("${busStops[index].hatNo}"),
            subtitle: Text(busStops[index].adi ?? ""),
          );
        },
      ),
    );
  }
}
