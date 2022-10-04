import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';

class ScheduleTable2 extends StatelessWidget {
  const ScheduleTable2({super.key, required this.data});

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(CustomStyles.padding),

      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1),
        children:  [

          for(int i = 0; i < data.length; i++) TableRow(
              children: [
                for (int j = 0; j < data[i].length; j++) Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(data[i][j]),
                ),
              ]
          ),

        ],
      ),
    );
  }
}