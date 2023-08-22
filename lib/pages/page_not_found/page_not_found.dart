import 'package:flutter/material.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/widgets/custom_text.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                context.translate(LangKeys.pageNotFound),
                size: 24,
                weight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
