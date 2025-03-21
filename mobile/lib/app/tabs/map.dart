import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import '../../store/deal_store.dart';
import '../../constants/colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DealController dealController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        backgroundColor: AppColors.primary, // Replace with your primary color
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(37.7749, -122.4194), // Default center (San Francisco)
          zoom: 12.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: dealController.deals.map((deal) {
              if (deal.longitude == null) {
                return null; // Skip invalid markers
              }
              return Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(deal.latitude, deal.longitude),
                builder: (ctx) => const Icon(
                  Icons.location_pin,
                  color: AppColors.primary,
                  size: 40,
                ),
              );
            }).whereType<Marker>().toList(), // Filter out null markers
          ),
        ],
      ),
    );
  }
}