import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
import 'package:ecommerce_with_mvc/logic/controller/theme_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[600],
              ),
              child: const Icon(
                Icons.dark_mode,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "DarkMode".tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Switch(
              activeColor: pinkClr,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: mainColor,
              value: controller.switchValue,
              onChanged: (value) {
                ThemeController().changeThemeMode();
                controller.switchValue = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
