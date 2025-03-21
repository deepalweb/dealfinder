import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/deal_card.dart';
import '../../components/empty_state.dart';
import '../../store/deal_store.dart';

class SavedDealsScreen extends StatelessWidget {
  const SavedDealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DealController dealController = Get.find();

    return Scaffold(
      appBar: const Header(title: "Saved Deals"),
      body: Obx(() => dealController.savedDeals.isEmpty
          ? const EmptyState()
          : ListView.builder(
              itemCount: dealController.savedDeals.length,
              itemBuilder: (context, index) {
                return DealCard(deal: dealController.savedDeals[index]);
              },
            )),
    );
  }
}