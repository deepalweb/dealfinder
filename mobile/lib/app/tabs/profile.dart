import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../store/user_store.dart';
import '../saved.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: const Header(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, ${userController.username.value}", style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                if (userController.isGuest.value) ...[
                  const Text("Sign in to save deals and access more features."),
                  ElevatedButton(
                    onPressed: () => userController.login("John Doe"), // Mock login
                    child: const Text("Sign In"),
                  ),
                ] else ...[
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text("Saved Deals"),
                    onTap: () => Get.to(() => const SavedDealsScreen()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {}, // Placeholder
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Log Out"),
                    onTap: () => userController.logout(),
                  ),
                ],
              ],
            )),
      ),
    );
  }
}