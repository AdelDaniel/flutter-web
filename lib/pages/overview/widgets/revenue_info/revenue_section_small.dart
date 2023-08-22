import 'package:flutter/material.dart';

import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/pages/overview/widgets/bar_chart.dart';
import 'package:web_app/pages/overview/widgets/revenue_info/revenue_info.dart';
import 'package:web_app/widgets/custom_text.dart';

class RevenueSectionSmall extends StatelessWidget {
  const RevenueSectionSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColors.lightGrey.withOpacity(.1),
              blurRadius: 12,)
        ],
        border: Border.all(color: AppColors.lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                context.translate(LangKeys.revenueChart),
                size: 20,
                weight: FontWeight.bold,
                color: AppColors.lightGrey,
              ),
              const SimpleBarChart(),
            ],
          ),
          Container(
            width: 120,
            height: 1,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    RevenueInfo(
                      title: "Toda's revenue",
                      amount: '230',
                    ),
                    RevenueInfo(
                      title: 'Last 7 days',
                      amount: '1,100',
                    ),
                  ],
                ),
                Row(
                  children: [
                    RevenueInfo(
                      title: 'Last 30 days',
                      amount: '3,230',
                    ),
                    RevenueInfo(
                      title: 'Last 12 months',
                      amount: '11,300',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
