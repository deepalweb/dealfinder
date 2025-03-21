import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../mocks/deals.dart';
import 'package:get/get.dart';
import '../store/deal_store.dart';
import '../app/deal/detail.dart';

class DealCard extends StatelessWidget {
  final Deal deal;
  const DealCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final DealController dealController = Get.find();

    return GestureDetector(
      onTap: () => Get.to(() => DealDetailScreen(deal: deal)),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image with error handling
              Image.network(
                deal.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deal.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${deal.discount}% OFF - ${deal.category}",
                      style: const TextStyle(color: AppColors.textLight),
                    ),
                    Text(
                      "Expires: ${_formatDate(deal.expiration)}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Obx(() => IconButton(
                    icon: Icon(
                      dealController.savedDeals.contains(deal)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.secondary,
                    ),
                    onPressed: () => dealController.toggleSaveDeal(deal),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to format the expiration date
  String _formatDate(DateTime? date) {
    if (date == null) return "N/A";
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}