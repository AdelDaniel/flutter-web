import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:web_app/constants/app_colors.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/models/side_menu_item_type.dart';
import 'package:web_app/widgets/custom_text.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: context.isSmallScreen ? 56 : 6),
              child: CustomText(
                context.translate(
                  SideMenuItemType.drivers.displayLangKeyName,
                ),
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Expanded(
          child: DriversTable(),
        ),
      ],
    );
  }
}

/// Example without datasource
class DriversTable extends StatelessWidget {
  const DriversTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: AppColors.lightGrey.withOpacity(.1),
            blurRadius: 12,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text('Name'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Location'),
          ),
          DataColumn(
            label: Text('Rating'),
          ),
          DataColumn(
            label: Text('Action'),
          ),
        ],
        rows: List<DataRow>.generate(
          15,
          (index) => DataRow(
            cells: [
              const DataCell(CustomText('Santos Enoque')),
              const DataCell(CustomText('New yourk city')),
              const DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      '4.5',
                    )
                  ],
                ),
              ),
              DataCell(
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.light,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.active, width: .5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: CustomText(
                    'Block',
                    color: AppColors.active.withOpacity(.7),
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
