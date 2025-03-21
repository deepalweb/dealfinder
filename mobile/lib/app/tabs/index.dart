import 'package:flutter/material.dart';
import '../../components/deal_card.dart';
import '../../components/category_filter.dart';
import '../../components/empty_state.dart';
import 'package:get/get.dart';
import '../../store/deal_store.dart';
import '../../constants/colors.dart'; // Import AppColors if defined

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DealController dealController = Get.put(DealController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Deals"),
        backgroundColor: AppColors.primary, // Use AppColors.primary if defined
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CategoryFilter(),
          ),
          Expanded(
            child: Obx(() {
              if (dealController.filteredDeals.isEmpty) {
                return const EmptyState(
                  message: "No deals available. Try selecting a different category.",
                );
              }
              return ListView.builder(
                itemCount: dealController.filteredDeals.length,
                itemBuilder: (context, index) {
                  return DealCard(deal: dealController.filteredDeals[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}