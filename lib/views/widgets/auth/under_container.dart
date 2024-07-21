import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class UnderContainer extends StatelessWidget {
  const UnderContainer({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTaptext2,
    this.backgroundColor = mainColor,
  });
  final String text1;
  final String text2;
  final VoidCallback onTaptext2;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text1,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          InkWell(
            onTap: onTaptext2,
            child: TextUtils(
              text: text2,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              textDecoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
