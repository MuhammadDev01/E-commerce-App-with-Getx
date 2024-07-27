import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/settings/dark_mode_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/settings/language_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/settings/logout_button.dart';
import 'package:ecommerce_with_mvc/views/widgets/settings/profile_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const ProfileWidget(),
        const SizedBox(
          height: 5,
        ),
        Divider(
          color: Get.isDarkMode ? Colors.white : Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
        const TextUtils(
          text: 'GENERAL',
          fontSize: 14,
          color: mainColor,
        ),
         const SizedBox(
          height: 10,
        ),
        const DarkModeWidget(),
        const SizedBox(
          height: 15,
        ),
        const LanguageWidget(),
          const SizedBox(
          height: 15,
        ),
        const LogOutButton(),
      ],
    );
  }
}
