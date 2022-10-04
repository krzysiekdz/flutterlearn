import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/styles/Styles.dart';

class ScheduleTable3 extends StatelessWidget {
  const ScheduleTable3({super.key, required this.data});

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {

    return Container(
//      decoration: blackBorder(),
      child: Row(
        children: [
          SingleColumn(data: data,),
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
  const SingleColumn({super.key, required this.data});



  @override
  Widget build(BuildContext context) {
    return DataTable(
//        headingRowColor: MaterialStateProperty.all(CustomColors.lightRed2),
        columnSpacing: 0,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        columns: const [
          DataColumn(label: Text('')),
        ],
        rows: [
          for(int i = 0; i < data.length; i++)
            DataRow(
                selected:  (i%2==0),
                cells: [
              DataCell(
                  Container(
                    child: Text(data[i][0]),
                  )
              ),
            ]),
        ],
    );
  }
}

class ScrollableTable extends StatelessWidget {
  final List<List<String>> data;
  const ScrollableTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return DataTable(
//      headingRowColor: MaterialStateProperty.all(CustomColors.lightRed2),
      columnSpacing: 12,
      columns:  [
        for(int i = 1; i < data[0].length; i++)
           DataColumn(label: Text('#$i'))
      ],
      //dokonczyc przyklad ze strony dla : colors (resolveWith)
      rows: List<DataRow>.generate(data.length, (i) => DataRow(
        cells: List<DataCell>.generate(data[i].length, (j) => DataCell( Text(data[i][j]) ))
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