import 'package:ecommerce_with_mvc/logic/controller/auth_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "Logout From App?",
            titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 22,
                ),
            middleText: 'Are you sure you need to logout',
            middleTextStyle:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
            radius: 10,
            textCancel: " No ",
            cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
            textConfirm: " YES ",
            confirmTextColor: Get.isDarkMode ? Colors.black : Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOutFromApp();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        borderRadius: BorderRadius.circular(6),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Logout",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
