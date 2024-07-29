import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/payment/delivery_container_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/payment/payment_method_widget.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Payment',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ListView(
          children: [
            Text(
              'Shipping to',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DeliveryContainerWidget(),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            const PaymentMethodWidget(),
            const SizedBox(
              height: 10,
            ),
            const PayNowButton(),
          ],
        ),
      ),
    );
  }
}

class PayNowButton extends StatelessWidget {
  const PayNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: 'Total : 180\$',
            fontSize: 18,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor:
                    Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
              ),
              child: const TextUtils(
                text: 'Pay Now',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
