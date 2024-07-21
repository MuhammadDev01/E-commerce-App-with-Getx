import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
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
              "DarkMode",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            Switch(
              activeColor: Colors.blue[700],
              activeTrackColor: Colors.grey,
              value: true, //CachedHelper.getData(key: 'isDark'),
              onChanged: (value) {
                // controller.changeThemeMode(CachedHelper.getData(key: 'isDark'));
                // CachedHelper.getData(key: 'isDark')
                //     ? Get.changeThemeMode(ThemeMode.dark)
                //     : Get.changeThemeMode(ThemeMode.light);
              },
            ),
          ],
        ),
      ),
    );
  }
}
