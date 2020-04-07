import 'package:assign_task/accounts.dart';
import 'package:assign_task/languages.dart';
import 'package:assign_task/loginpage.dart';
import 'package:assign_task/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';


class CustomScaffold extends StatefulWidget {

  final Widget body;
  final String appbarText;
  final String username;

  CustomScaffold({this.body,this.appbarText,this.username});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 393, height: 873, allowFontScaling: false);

    return Scaffold(
        backgroundColor: Colors.white,
          body: widget.body,
          appBar: AppBar(
            backgroundColor: Color(0xff00a79b),
            title: Text(widget.appbarText,style: TextStyle(color: Colors.white),),
            // centerTitle: true,
        ),
        drawer: Drawer(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(15.0)),
                child: ListView(
                  children: <Widget> [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/"),
                        fit: BoxFit.cover)
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:Icon(
                            Icons.account_circle,
                            size: ScreenUtil().setWidth(40.0),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(12.0),
                        ),
                        Expanded(
                          flex: 5,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Username',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.w700,
                              ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(2),
                              ),
                              Text(widget.username,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            tooltip: 'Edit Profile',
                            onPressed: (){

                            },
                          ),
                        ),
                      ],
                    ), 
                  ),
                  ListTile(
                    title: Text('Account'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountsPage(username:widget.username))
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Languages'),
                    onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LanguagesPage(username:widget.username))
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Settings'),
                    onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage(username:widget.username))
                      );
                      
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  ),
                ],
              ),
            )
          ),
      ); 
  }
}