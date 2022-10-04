import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
            children: const [
              Text('Not found'),
            ],
          )
      ),
    );
  }
}