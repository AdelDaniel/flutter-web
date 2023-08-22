import 'package:flutter/material.dart';
import 'package:web_app/constants/constants.dart';

class InfoCard extends StatelessWidget {

  const InfoCard({
    required this.title, required this.value, required this.onTap, super.key,
    this.isActive = false,
    this.topColor,
  });
  final String title;
  final String value;
  final Color? topColor;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 6),
                color: AppColors.lightGrey.withOpacity(.1),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: topColor ?? AppColors.active,
                      height: 5,
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$title\n',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isActive ? AppColors.active : AppColors.lightGrey,
                      ),
                    ),
                    TextSpan(
                      text: value,
                      style: TextStyle(
                        fontSize: 40,
                        color: isActive ? AppColors.active : AppColors.dark,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
