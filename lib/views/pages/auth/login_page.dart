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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AuthController controller = Get.find<AuthController>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                          text: 'LOG',
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        TextUtils(
                          text: 'IN',
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                      height: 18,
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
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          icon: Icon(
                            controller.isVisibilty
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: TextUtils(
                          text: 'Forgot Password?',
                          fontSize: 16,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.forgotPasswordPage);
                        },
                      ),
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => Row(
                        children: [
                          CheckIcon(
                              onTap: () {
                                controller.checkIcon();
                              },
                              child: controller.check
                                  ? Image.asset(
                                      'assets/images/check.png',
                                      color:
                                          Get.isDarkMode ? pinkClr : mainColor,
                                    )
                                  : const SizedBox()),
                          const SizedBox(
                            width: 10,
                          ),
                          TextUtils(
                            text: 'Remember me',
                            fontSize: 15,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AuthButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.logInWithFirebase(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );
                        }
                      },
                      text: 'LOG IN',
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextUtils(
                      text: 'OR',
                      fontSize: 15,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.asset('assets/images/facebook.png')),
                        const SizedBox(
                          width: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) => InkWell(
                              onTap: () {
                                controller.logInWithGoogleFirebase();
                              },
                              child: Image.asset('assets/images/google.png')),
                        ),
                      ],
                    ),
                  const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            UnderContainer(
              text1: "Don't have an Account? ",
              text2: 'Sign up',
              backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
              onTaptext2: () {
                Get.offNamed(Routes.signUpPage);
              },
            ),
          ],
        ));
  }
}
