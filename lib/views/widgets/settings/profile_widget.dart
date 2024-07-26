import 'package:ecommerce_with_mvc/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: ClipOval(
              child: Image.network(
                'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.capitalize(name: 'username'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'email@gmail.com',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
