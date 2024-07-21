import 'package:ecommerce_with_mvc/logic/controller/theme_controller.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: TextButton(
          onPressed: () {
            ThemeController().changeThemeMode();
          },
          child: Text('Settings Page',
              style: Theme.of(context).textTheme.bodySmall),
        ),
      );
    
  }
}
