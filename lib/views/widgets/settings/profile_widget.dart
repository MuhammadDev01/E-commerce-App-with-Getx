import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/views/auth/forgot_password_view.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => Column(
        children: [
          controller.profileUser == null
              ? const LoadingWidget()
              : Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user image profile.png',
                          fit: BoxFit.cover,
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
                          controller.profileUser?.name ?? 'username',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 18,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.profileUser?.email ?? 'email@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 16,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
