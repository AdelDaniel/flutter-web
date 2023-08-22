import 'package:flutter/material.dart';
import 'package:web_app/constants/constants.dart';

class RevenueInfo extends StatelessWidget {

  const RevenueInfo({super.key, this.title, this.amount});
  final String? title;
  final String? amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title \n\n',
              style: const TextStyle(color: AppColors.lightGrey, fontSize: 16),
            ),
            TextSpan(
              text: '\$ $amount',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
