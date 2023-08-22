import 'package:flutter/material.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/widgets/custom_text.dart';

class InfoCardSmall extends StatelessWidget {

  const InfoCardSmall({
    required this.title, required this.value, required this.onTap, super.key,
    this.isActive = false,
  });
  final String title;
  final String value;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isActive ? AppColors.active : AppColors.lightGrey,
                  width: .5,),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title,
                  size: 24,
                  weight: FontWeight.w300,
                  color: isActive ? AppColors.active : AppColors.lightGrey,
                ),
                CustomText(
                  value,
                  size: 24,
                  weight: FontWeight.bold,
                  color: isActive ? AppColors.active : AppColors.dark,
                )
              ],
            ),),
      ),
    );
  }
}
