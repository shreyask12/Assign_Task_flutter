import 'package:assign_task/widgets/CommonMenu.dart';
import 'package:flutter/material.dart';

class LanguagesPage extends StatefulWidget {

  static String id = 'languages';
  final String username;

  LanguagesPage({this.username});

  @override
  _LanguagesPageState createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarText: 'Languages',
      username: widget.username,
      body: Container(
        
      ),
    );
  }
}