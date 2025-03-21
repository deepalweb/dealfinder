import 'package:flutter/material.dart';
import '../constants/colors.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.local_offer_outlined, size: 60, color: AppColors.textLight),
          const SizedBox(height: 16),
          Text("No Deals Found", style: TextStyle(fontSize: 18, color: AppColors.textLight)),
        ],
      ),
    );
  }
}