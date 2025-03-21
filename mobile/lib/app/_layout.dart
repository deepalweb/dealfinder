import 'package:flutter/material.dart';

class RootLayout extends StatelessWidget {
  final Widget child;
  const RootLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child; // Simple pass-through for now
  }
}