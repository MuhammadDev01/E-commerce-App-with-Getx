import 'package:ecommerce_with_mvc/logic/controller/auth_controller.dart';
import 'package:ecommerce_with_mvc/views/widgets/auth/auth_button.dart';
import 'package:ecommerce_with_mvc/views/widgets/auth/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswprdPage extends StatefulWidget {
  const ForgotPasswprdPage({super.key});

  @override
  State<ForgotPasswprdPage> createState() => _ForgotPasswprdPageState();
}

class _ForgotPasswprdPageState extends State<ForgotPasswprdPage> {
  var emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'If you forgot your password , please provide your email to reset',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset('assets/images/forgetpass copy.png'),
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
                ),
              ),
              const Spacer(),
              GetBuilder<AuthController>(
                builder: (controller) => AuthButton(
                    text: 'Send',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPasswordWithFirebase(
                            email: emailController.text.trim());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
