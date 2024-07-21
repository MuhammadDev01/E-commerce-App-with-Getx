import 'package:ecommerce_with_mvc/logic/controller/auth_controller.dart';
import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/auth/auth_button.dart';
import 'package:ecommerce_with_mvc/views/widgets/auth/auth_text_form_field.dart';
import 'package:ecommerce_with_mvc/views/widgets/auth/check_widgets.dart';
import 'package:ecommerce_with_mvc/views/widgets/auth/under_container.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AuthController controller = Get.find<AuthController>();

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                          text: 'SIGN',
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        TextUtils(
                          text: 'UP',
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    AuthTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      controller: userController,
                      keyboardType: TextInputType.text,
                      hintText: 'User Name',
                      prefixIcon: Image.asset(
                        'assets/images/user.png',
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AuthTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      prefixIcon: Image.asset(
                        'assets/images/email.png',
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        obscureText: controller.isVisibilty,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        prefixIcon: Image.asset(
                          'assets/images/lock.png',
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.visibilty();
                          },
                          color: mainColor,
                          icon: Icon(
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            controller.isVisibilty
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => CheckWidget(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          onTap: () {
                            controller.checkIcon();
                          },
                          child: controller.check
                              ? Image.asset(
                                  'assets/images/check.png',
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                )
                              : const SizedBox()),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (controller.check) {
                              controller.signUpWithFirebase(
                                name: userController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              );
                            } else {
                              Get.snackbar(
                                'check box'.capitalize!,
                                'accept terms & conditions to continue!',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green[600],
                                colorText: Colors.white
                              );
                            }
                          }
                        },
                        text: 'SIGN UP',
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              UnderContainer(
                text1: 'Already have an Account? ',
                text2: 'Log in',
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                onTaptext2: () {
                  Get.offNamed(Routes.loginPage);
                },
              )
            ],
          ),
        ));
  }
}
