import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
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
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController phoneController2 = TextEditingController();
  var controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeliveryContainerBuilder(
          phoneController: phoneController1,
          color: changeColor ? Colors.grey[300] : Colors.white,
          address: 'ward street-London-England',
          name: 'muhammad',
          title: 'Cash',
          value: 0,
          groupValue: groupValue,
          controller: controller,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
              changeColor = !changeColor;
              controller.updatePosition();
            });
          },
        ),
        const SizedBox(height: 10),
        DeliveryContainerBuilder(
          phoneController: phoneController2,
          color: changeColor ? Colors.white : Colors.grey[300],
          address: 'cairo street-Giza-Egypt',
          name: 'khaled',
          title: 'Delivery',
          value: 1,
          controller: controller,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value!;
              changeColor = !changeColor;
              controller.updatePosition();
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
    required this.address,
    required this.value,
    this.onChanged,
    required this.groupValue,
    required this.phoneController, required this.controller,
  });

  final String title;
  final String name;
  final String address;
  final Color? color;
  final int value;
  final void Function(int?)? onChanged;
  final int groupValue;
  final MainController controller; 
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '🇪🇬 +20 ${controller.phone}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                        ),
                        InkWell(
                          onTap: () {
                            editPhoneNumberMethod(context);
                          },
                          child: Icon(
                            Icons.contact_phone,
                            size: 20,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      controller.address.value,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> editPhoneNumberMethod(BuildContext context) {
    return Get.defaultDialog(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      title: 'Phone Number',
      titleStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 18,
          ),
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      buttonColor: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
      onConfirm: () {
        controller.phone.value = phoneController.text;
        Get.back();
      },
      confirmTextColor: Colors.white,
      content: TextField(
        maxLength: 11,
        controller: phoneController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "enter phone number",
          counterStyle: const TextStyle(fontSize: 12),
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey[500],
                fontSize: 12,
              ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            onPressed: () {
              phoneController.clear();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
          prefixIcon: Icon(
            Icons.phone,
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Get.isDarkMode ? pinkClr.withOpacity(0.7) : mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
