import 'package:assign_task/languages.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'loginpage.dart';
import 'accounts.dart';
import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AssignTask',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:Colors.black,
          accentColor: Colors.black,
          // primarySwatch: Colors.blue,
          fontFamily: 'DejaVu Sans',
        ),
        // home: LoginPageUI(),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id : (context) => LoginPage(),
          AccountsPage.id : (context) => AccountsPage(),
          SettingsPage.id : (context) => SettingsPage(),
          LanguagesPage.id : (context) => LanguagesPage(),
        },
      );
  }
}

