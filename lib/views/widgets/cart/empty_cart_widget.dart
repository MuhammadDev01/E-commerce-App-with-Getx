import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 150,
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Cart is ",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                TextSpan(
                  text: "Empty",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Add items to get started",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.mainPage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Go To Home',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
