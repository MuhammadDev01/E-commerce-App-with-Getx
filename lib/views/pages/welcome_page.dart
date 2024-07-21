import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 210,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: TextUtils(text: 'Welcome', fontSize: 27)),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(text: 'Asroo', fontSize: 36, color: mainColor),
                    SizedBox(width: 10),
                    TextUtils(text: 'Shop', fontSize: 36),
                  ],
                ),
              ),
              const SizedBox(
                height: 240,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.loginPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 14,
                  ),
                ),
                child: const TextUtils(
                  text: 'Get Start',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextUtils(
                    text: "Don't have an Account?",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                    onPressed: () {
                      Get.offNamed(Routes.signUpPage);
                    },
                    child: const TextUtils(
                      text: 'Sign up',
                      textDecoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
