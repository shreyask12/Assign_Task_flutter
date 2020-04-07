import 'package:assign_task/widgets/CommonMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// import 'model/UserModel.dart';


class AccountsPage extends StatefulWidget {

  static String id = 'accounts';
  final String username;

  AccountsPage({this.username});

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 393, height: 873, allowFontScaling: false);
    return CustomScaffold(
        appbarText: 'User Accounts',
        username: widget.username,
        body: Container(
          child: SafeArea(
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                      maxRadius: ScreenUtil().setWidth(60.0),
                    ),
                    
                    Text(
                      widget.username,
                       style: TextStyle(
                         fontFamily: 'Pacifico',
                         fontSize: ScreenUtil().setSp(20.0),
                         color: Colors.teal.shade900,
                         fontWeight: FontWeight.bold,
                       ),
                      ),
                      Text(
                        'FLUTTER DEVELOPER',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize:  ScreenUtil().setSp(20.0),
                          color: Colors.teal.shade100,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20.0),
                        width: ScreenUtil().setWidth(150.0),
                        child: Divider(
                          color: Colors.teal.shade900,
                          ),
                      ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10.0),horizontal: ScreenUtil().setWidth(25.0)),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                        ),
                      title: Text(
                            '+44 123 456 789',
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro',
                              fontSize: ScreenUtil().setSp(20.0),
                            ),
                          ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25.0),vertical: ScreenUtil().setWidth(10.0)),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color:Colors.teal,
                        ),
                        title: Text(
                              'shreyashkotian@gmail.com',
                                style: TextStyle(
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: ScreenUtil().setSp(20.0), 
                                ),
                              ),
                      )
                    )
                  ],
                  
                ) 
            ),
          ),
        );
       
  
  }
}