import 'package:flutter/material.dart';

import 'package:web_app/config/router/routes_name.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/models/side_menu_item_type.dart';
import 'package:web_app/pages/overview/widgets/overview_cards/overview_cards_large.dart';
import 'package:web_app/pages/overview/widgets/overview_cards/overview_cards_meduim.dart';
import 'package:web_app/pages/overview/widgets/overview_cards/overview_cards_small.dart';
import 'package:web_app/pages/overview/widgets/overview_table.dart';
import 'package:web_app/pages/overview/widgets/revenue_info/revenue_section_large.dart';
import 'package:web_app/pages/overview/widgets/revenue_info/revenue_section_small.dart';
import 'package:web_app/widgets/custom_text.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const String routeName = RoutesName.overviewPageRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(top: context.isSmallScreen ? 56 : 6),
                child: CustomText(
                  context
                      .translate(SideMenuItemType.overview.displayLangKeyName),
                  size: 24,
                  weight: FontWeight.bold,
                ),),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              if (context.isLargeScreen || context.isMediumScreen)
                if (context.isCustomSize)
                  const OverviewCardsMediumScreen()
                else
                  const OverviewCardsLargeScreen()
              else
                const OverviewCardsSmallScreen(),
              if (!context.isSmallScreen)
                const RevenueSectionLarge()
              else
                const RevenueSectionSmall(),
              const OverviewTable(),
            ],
          ),
        )
      ],
    );
  }
}
