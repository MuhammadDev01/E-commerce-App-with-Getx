import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/card_items_home.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/search_form_home.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? darkGreyClr : mainColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: "Find Your",
                  fontSize: 24,
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: "INSPERATION",
                  fontSize: 28,
                ),
                SizedBox(
                  height: 20,
                ),
                SearchFormHome(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CardItemsHome(),
      ],
    );
  }
}
