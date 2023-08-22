import 'package:flutter/material.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/pages/overview/widgets/overview_cards/info_card_small.dart';

class OverviewCardsSmallScreen extends StatelessWidget {
  const OverviewCardsSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: context.translate(LangKeys.ridesInProgress),
            value: '7',
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: width / 64,
          ),
          InfoCardSmall(
            title: context.translate(LangKeys.packagesDelivered),
            value: '17',
            onTap: () {},
          ),
          SizedBox(
            height: width / 64,
          ),
          InfoCardSmall(
            title: context.translate(LangKeys.cancelledDelivery),
            value: '3',
            onTap: () {},
          ),
          SizedBox(
            height: width / 64,
          ),
          InfoCardSmall(
            title: context.translate(LangKeys.scheduledDeliveries),
            value: '32',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
