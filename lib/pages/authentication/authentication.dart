import 'package:flutter/material.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/widgets/custom_text.dart';

class AuthenticationPage extends StatelessWidget {
  /// Authentication Page Constructor
  const AuthenticationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: FlutterLogo(),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  CustomText(
                    context.translate(LangKeys.login),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    context.translate(LangKeys.welcome) +
                        context.translate(LangKeys.appName),
                    color: AppColors.lightGrey,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: context.translate(LangKeys.email),
                  hintText: 'abc@domain.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: context.translate(LangKeys.password),
                  hintText: '123',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const CustomText(
                        'Remeber Me',
                      ),
                    ],
                  ),
                  CustomText(
                    '${context.translate(LangKeys.forgetPassword)}?',
                    color: AppColors.active,
                  )
                ],
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // Get.offAllNamed(rootRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.active,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    context.translate(LangKeys.login),
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Text.rich(
              //   TextSpan(
              //     children: [
              //       TextSpan(text: "Do not have admin credentials? "),
              //       TextSpan(
              //         text: "Request Credentials! ",
              //         style: TextStyle(color: AppColors.active),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
