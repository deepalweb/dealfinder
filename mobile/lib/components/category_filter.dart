import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:get/get.dart';
import '../store/deal_store.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final DealController dealController = Get.find();
    final categories = ["All", "Food", "Shopping", "Entertainment"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChoiceChip(
                label: Text(category),
                selected: dealController.filteredDeals.every((deal) => deal.category == category) && category != "All",
                onSelected: (selected) => dealController.filterByCategory(category),
                selectedColor: AppColors.primaryLight,
                backgroundColor: AppColors.white,
                labelStyle: TextStyle(color: selected ? AppColors.white : AppColors.text),
              ),
            )).toList(),
      ),
    );
  }
}