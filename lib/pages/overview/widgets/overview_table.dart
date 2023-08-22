import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/widgets/custom_text.dart';

/// One Row Height
const double _rowHeight = 56;
const double _headingRowHeight = 40;

/// Example without datasource
class OverviewTable extends StatelessWidget {
  const OverviewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColors.lightGrey.withOpacity(.1),
              blurRadius: 12,)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                'Available Drivers',
                color: AppColors.lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: (_rowHeight * 7) + _headingRowHeight,
            child: DataTable2(
              columnSpacing: 5,
              dataRowHeight: _rowHeight,
              headingRowHeight: _headingRowHeight,
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
                7,
                (index) => DataRow(
                  cells: [
                    const DataCell(CustomText('Santos Enoque')),
                    const DataCell(CustomText('New yourk city')),
                    const DataCell(
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star,
                              color: AppColors.contentColorOrange, size: 18,),
                          SizedBox(width: 5),
                          CustomText('4.5'),
                        ],
                      ),
                    ),
                    DataCell(
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.light,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: AppColors.active, width: .5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6,),
                        child: CustomText(
                          'Assign Delivery',
                          color: AppColors.active.withOpacity(.7),
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
