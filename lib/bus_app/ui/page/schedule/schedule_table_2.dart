import 'package:flutter/material.dart';
import 'package:flutterlearn/bus_app/styles/custom_colors.dart';
import 'package:flutterlearn/bus_app/styles/style_utils.dart';
import 'package:flutterlearn/styles/Styles.dart';

class ScheduleTable2 extends StatelessWidget {
  const ScheduleTable2({super.key, required this.data});

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
//    DataTable - check it

    return Container(
//      decoration: blackBorder(),
      width: double.infinity,
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(CustomStyles.padding),
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              for(int i = 0; i < data.length; i++)
                Container(
                  decoration: (i%2 == 0) ? const BoxDecoration(color: CustomColors.lightRed) : null,
                  child: Row(
                      children: [ for(int j = 0; j < data[i].length; j++)
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: j == 0 ? 120 : 60,
//                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                          child: Text(data[i][j]), )
                      ]
                  ),
                ),
            ],
          ),
      ),
    );
  }
}