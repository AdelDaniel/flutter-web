import 'package:flutter/material.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/pages/overview/widgets/overview_cards/info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
  const OverviewCardsMediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: context.translate(LangKeys.ridesInProgress),
              value: '7',
              onTap: () {},
              topColor: Colors.orange,
            ),
            SizedBox(
              width: width / 64,
            ),
            InfoCard(
              title: context.translate(LangKeys.packagesDelivered),
              value: '17',
              topColor: Colors.lightGreen,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: width / 64,
        ),
        Row(
          children: [
            InfoCard(
              title: context.translate(LangKeys.cancelledDelivery),
              value: '3',
              topColor: Colors.redAccent,
              onTap: () {},
            ),
            SizedBox(
              width: width / 64,
            ),
            InfoCard(
              title: context.translate(LangKeys.scheduledDeliveries),
              value: '32',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
