import 'package:assign_task/widgets/CommonMenu.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  static String id = 'SettingsPage';
  final String username;

   SettingsPage({this.username});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarText: 'Settings',
      username: widget.username,
      body: Container(

      ),
    );
  }
}