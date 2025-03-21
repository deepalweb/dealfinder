import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'app/tabs/index.dart'; // DealsScreen
import 'app/tabs/map.dart'; // MapScreen
import 'app/tabs/profile.dart'; // ProfileScreen
import 'constants/colors.dart'; // AppColors
import 'store/deal_store.dart'; // DealController

void main() {
  Get.put(DealController()); // Initialize DealController
  runApp(const DealFinderApp());
}

class DealFinderApp extends StatelessWidget {
  const DealFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealFinder',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
          titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DealFinder'),
        ),
        body: const TabBarView(
          children: [
            DealsScreen(), // Deals tab
            MapScreen(), // Map tab
            ProfileScreen(), // Profile tab
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.local_offer), text: 'Deals'),
            Tab(icon: Icon(Icons.map), text: 'Map'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textLight,
        ),
      ),
    );
  }
}