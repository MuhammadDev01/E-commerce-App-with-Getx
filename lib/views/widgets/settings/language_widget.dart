import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  String currnetVal = 'en';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: languageSettings,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Language".tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
              ],
            ),
          ),
          DropdownButtonHideUnderline(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: DropdownButton<String>(
                items:  [
                  DropdownMenuItem(
                    value: 'ar',
                    child: TextUtils(
                      text: arLang,
                      fontSize: 16,
                      color: Get.isDarkMode?Colors.white:Colors.black,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'en',
                    child: TextUtils(
                      text: enLang,
                      fontSize: 16,
                      color: Get.isDarkMode?Colors.white:Colors.black,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'fr',
                    child: TextUtils(
                      text: frLang,
                      fontSize: 16,
                      color: Get.isDarkMode?Colors.white:Colors.black,
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    currnetVal = value!;
                  });
                  controller.changeLangauge(value!);
                },
                value: currnetVal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
