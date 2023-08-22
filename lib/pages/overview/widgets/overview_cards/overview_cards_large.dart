import 'package:flutter/material.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/pages/overview/widgets/overview_cards/info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        const RidesInProgressCard(),
        SizedBox(
          width: width / 64,
        ),
        const PackagesDeliveredCard(),
        SizedBox(
          width: width / 64,
        ),
        const CancelledDeliveryCard(),
        SizedBox(
          width: width / 64,
        ),
        const ScheduledDeliveriesCard(),
      ],
    );
  }
}

class RidesInProgressCard extends StatelessWidget {
  const RidesInProgressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: context.translate(LangKeys.ridesInProgress),
      value: '7',
      onTap: () {},
      topColor: Colors.orange,
    );
  }
}

class ScheduledDeliveriesCard extends StatelessWidget {
  const ScheduledDeliveriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: context.translate(LangKeys.scheduledDeliveries),
      value: '32',
      onTap: () {},
    );
  }
}

class CancelledDeliveryCard extends StatelessWidget {
  const CancelledDeliveryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: context.translate(LangKeys.cancelledDelivery),
      value: '3',
      topColor: Colors.redAccent,
      onTap: () {},
    );
  }
}

class PackagesDeliveredCard extends StatelessWidget {
  const PackagesDeliveredCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: context.translate(LangKeys.packagesDelivered),
      value: '17',
      topColor: Colors.lightGreen,
      onTap: () {},
    );
  }
}
