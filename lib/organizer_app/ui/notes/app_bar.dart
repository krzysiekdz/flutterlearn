import 'package:flutter/material.dart';

class NotesAppBarBuilder {

  final String title = 'Notatki!';
  final double height = 90.0;
  final double paddingTop = 12;

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: AppBar(
          leading: const Icon(Icons.menu),
          leadingWidth: 100,
          centerTitle: true,
          title: Text(title),
          actions: const [
            Icon(Icons.search),
            SizedBox(width: 24,)
          ],
        ),
      ),
    );
  }
}