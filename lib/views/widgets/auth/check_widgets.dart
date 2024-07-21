import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({
    super.key,
    required this.onTap,
    required this.child,
    this.color = Colors.black,
  });
  final VoidCallback onTap;
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckIcon(onTap: onTap, child: child),
        const SizedBox(
          width: 10,
        ),
        TextUtils(
          text: 'I accept ',
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w400,
        ),
        TextUtils(
          text: 'terms & conditions',
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w400,
          textDecoration: TextDecoration.underline,
        ),
      ],
    );
  }
}

class CheckIcon extends StatelessWidget {
  const CheckIcon({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
