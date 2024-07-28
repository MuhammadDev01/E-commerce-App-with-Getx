import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({
    super.key,
  });

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int groupValue = 0;
  bool changeColor = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeliveryContainerBuilder(
          color: changeColor ? Colors.grey[300] : Colors.white,
          address: 'address',
          name: 'name',
          phone: 'phone',
          title: 'title',
          value: 0,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const SizedBox(height: 10),
        DeliveryContainerBuilder(
          color: changeColor ? Colors.white : Colors.grey[300],
          address: 'address',
          name: 'name',
          phone: 'phone',
          title: 'title',
          value: 1,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
              changeColor = !changeColor;
            });
          },
        ),
      ],
    );
  }
}

class DeliveryContainerBuilder extends StatelessWidget {
  const DeliveryContainerBuilder({
    super.key,
    required this.color,
    required this.title,
    required this.name,
    required this.phone,
    required this.address,
    required this.value,
    this.onChanged,
    required this.groupValue,
  });

  final String title;
  final String name;
  final String phone;
  final String address;
  final Color? color;
  final int value;
  final void Function(int?)? onChanged;
  final int groupValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 3,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              groupValue: groupValue,
              onChanged: onChanged,
              value: value,
              fillColor:
                  WidgetStatePropertyAll(Get.isDarkMode ? pinkClr : mainColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Text(
                    phone,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Text(
                    address,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
