import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/styles/Styles.dart';

class ScheduleTable3 extends StatelessWidget {
  const ScheduleTable3({super.key, required this.data, required this.title});

  final List<List<String>> data;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(CustomStyles.padding),
      child: Row(
        children: [
          SingleColumn(data: data, title: title,),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ScrollableTable(data: data,)
              ),
          ),
        ],
      ),
    );
  }
}

class SingleColumn extends StatelessWidget {
  final List<List<String>> data;
  final String title;
  const SingleColumn({super.key, required this.data, required this.title});


  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 0,
        dataRowHeight: 32,
        horizontalMargin: 0,
        decoration: border(color: CustomColors.greyLight2),
        columns:  [
          DataColumn(label: Expanded(child: Text(title, style: TextStyle(color: CustomColors.primary), textAlign: TextAlign.center,))),
        ],
        rows: List<DataRow>.generate(data.length, (i) => DataRow(
          selected: (i%2) == 0,
          cells: List<DataCell>.generate(1, (j) => DataCell(
            Container(
                padding: const EdgeInsets.only(left: CustomStyles.padding, right: 4),
                child: Text(data[i][j])
            )
          )),
        )),

//        [
//
//          for(int i = 0; i < data.length; i++)
//            DataRow(
//                selected:  (i%2==0),
//                cells: [
//              DataCell(
//                  Container(
//                    child: Text(data[i][0]),
//                  )
//              ),
//            ]),
//        ],
    );
  }
}

class ScrollableTable extends StatelessWidget {
  final List<List<String>> data;
  const ScrollableTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 12,
      dataRowHeight: 32,
      horizontalMargin: 8,
      decoration: border(color: CustomColors.greyLight2),
      border: const TableBorder(verticalInside: BorderSide(color: CustomColors.greyLight2, width: 1)),
      columns:  [
        for(int i = 1; i < data[0].length; i++)
           DataColumn(label: Expanded(child: Text('#$i', textAlign: TextAlign.center,)))
      ],
      rows: List<DataRow>.generate(data.length, (i) => DataRow(
        selected: i % 2 == 0,
        cells: List<DataCell>.generate(data[i].length-1, (j) => DataCell(
            Text(data[i][j+1])
        )),
      )) ,

//      [
//        for(int i = 0; i < data.length; i++)
//          DataRow(
//              selected:  (i%2==0),
//              cells: [
//            for(int j = 1; j < data[i].length; j++)
//            DataCell(
//                Container(
//                  child: Text(data[i][j]),
//                )
//            ),
//          ]),
//      ],
    );
  }
}