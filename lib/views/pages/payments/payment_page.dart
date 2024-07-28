import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/payment/delivery_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
