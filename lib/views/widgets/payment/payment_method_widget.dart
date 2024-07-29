import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodBuilder(
          groupValue: groupValue,
          image: 'assets/images/paypal.png',
          title: 'Paypal',
          value: 0,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        PaymentMethodBuilder(
          groupValue: groupValue,
          image: 'assets/images/google.png',
          title: 'Google Pay',
          value: 1,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        PaymentMethodBuilder(
          groupValue: groupValue,
          image: 'assets/images/credit.png',
          title: 'Credit Card',
          value: 2,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
            });
          },
        ),
      ],
    );
  }
}

class PaymentMethodBuilder extends StatelessWidget {
  const PaymentMethodBuilder(
      {super.key,
      this.onChanged,
      required this.value,
      required this.groupValue,
      required this.image,
      required this.title});

  final void Function(int?)? onChanged;
  final int value;
  final int groupValue;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(
            width: 10,
          ),
          TextUtils(
            text: title,
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
          const Spacer(),
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            fillColor:
                WidgetStatePropertyAll(Get.isDarkMode ? pinkClr : mainColor),
          ),
        ],
      ),
    );
  }
}
