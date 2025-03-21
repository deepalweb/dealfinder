import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../mocks/deals.dart';

class DealDetailScreen extends StatelessWidget {
  final Deal deal;
  const DealDetailScreen({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deal Details"),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with loading and error handling
            Image.network(
              deal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 200,
                child: Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deal.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${deal.discount}% OFF",
                    style: const TextStyle(fontSize: 18, color: AppColors.secondary),
                  ),
                  Text(
                    deal.category,
                    style: const TextStyle(color: AppColors.textLight),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Expires: ${_formatDate(deal.expiration)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(deal.description),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Implement save functionality
                        },
                        icon: const Icon(Icons.favorite_border),
                        label: const Text("Save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Implement share functionality
                        },
                        icon: const Icon(Icons.share),
                        label: const Text("Share"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Implement directions functionality
                        },
                        icon: const Icon(Icons.directions),
                        label: const Text("Directions"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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