import 'package:ecommerce_with_mvc/views/widgets/settings/dark_mode_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        SizedBox(
          height: 50,
        ),
        DarkModeWidget(),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
