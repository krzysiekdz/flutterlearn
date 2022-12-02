
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/models/config.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';
import 'package:flutterlearn/bsxmobile/ui/widgets/circle_image.dart';

class UserProfile extends StatefulWidget {

  Config config;
  UserProfile({required this.config});

  @override
  State<StatefulWidget> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil użytkownika'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(CustomStyles.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Użytkownik', style: header4()),
              gap(),
              CircleImage(imgAsset: widget.config.pathAvatar, radius: 60, border: 2,),
            ],
          ),
        ),
      ),
    );
  }
}