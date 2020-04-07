import 'dart:ui';
import 'package:assign_task/model/UserModel.dart';
import 'package:assign_task/accounts.dart';
// import 'package:assign_task/widgets/CommonMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_task/model/validators.dart';
import 'widgets/button.dart';
import 'package:assign_task/database_class/database.dart';



class LoginPage extends StatefulWidget with EmailPasswordProviders {

  static String id = 'loginpage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginscaffoldkey = GlobalKey<ScaffoldState>();
  
   final TextEditingController textnamecontroller = TextEditingController();
   final TextEditingController passwordcontroller = TextEditingController();
   String get _email => textnamecontroller.text;
   String get _password => passwordcontroller.text;
    bool emailValid = true;

    bool passwordValid =true;

       


  @override
  void initState() {
    // 
    // LoadingScreen(duration: Duration(seconds: 5),pagenavigate: LoginPageUI.id);
    super.initState();
  }

  

  _submit() async {

    var dontproceed = true;

    if(_email == '' || _email == null ){
      setState(() {
        emailValid = false;
      });
      
      dontproceed =false;

    }
    if( _password == '' || _password == null ){
       setState(() {
        passwordValid = false;
      });
     dontproceed =false;
    }
   if(dontproceed){

    PersonDatabaseProvider.db.addPersonToDatabase(
      Person(
         name: textnamecontroller.text,
         password : passwordcontroller.text)
      );
      print('Done!');
      print('email = ${textnamecontroller.text} , password = ${passwordcontroller.text}');
      
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AccountsPage(username:textnamecontroller.text)),
  );
      

    } 

}

  @override
  Widget build(BuildContext context) {
   
    ScreenUtil.init(context, width: 393, height: 873, allowFontScaling: false);
  
      return Scaffold(
        key: _loginscaffoldkey,
        backgroundColor: Color(0xfffffff),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(480),
                width: ScreenUtil().setWidth(393),
                decoration: BoxDecoration(
                  color: Color(0xff042c38),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/MaskGroup1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
          
              ),
              Positioned(
                bottom: ScreenUtil().setWidth(0.0),
                child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom:ScreenUtil().setWidth(20.0),left:ScreenUtil().setWidth(30.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Divider(color: Colors.white,thickness: 10.0,height: 10.0,),
                        Text('Log In!',
                        style: TextStyle(color:Colors.white,
                          fontSize: ScreenUtil().setSp(20),
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(393),
                    height: ScreenUtil().setWidth(390),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      shape: BoxShape.rectangle,
            
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left:ScreenUtil().setWidth(30.0),right:ScreenUtil().setWidth(30.0),top:ScreenUtil().setWidth(20.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              // Icon(Icons.group),
                              Image.asset('assets/images/Icon-feather-user.png'),
                              Padding(
                                padding: EdgeInsets.only(left:ScreenUtil().setWidth(42.0)),
                                child: SizedBox(
                                  width: ScreenUtil().setWidth(230),
                                  child: TextField(
                                    inputFormatters:[
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    onChanged: (val){
                                      if(val != ''){
                                        setState(() {
                                          emailValid = true;
                                        });
                                      }
                                    },
                                    controller: textnamecontroller,
                                    keyboardType: TextInputType.emailAddress,
                                    // maxLength: 10,
                                    decoration: InputDecoration(
                                    hintText: 'Username',
                                    errorText: emailValid ? null :  widget.emailerror,
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              // Icon(Icons.lock),
                              Image.asset('assets/images/Icon-feather-lock.png'),
                              Padding(
                                padding: EdgeInsets.only(left:ScreenUtil().setWidth(42.0)),
                                child: SizedBox(
                                  width: ScreenUtil().setWidth(230),
                                  child: TextField(
                                    inputFormatters:[
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    onChanged: (val){
                                    if(val != ''){
                                        setState(() {
                                          passwordValid = true;
                                        });
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: passwordcontroller,
                                    obscureText: true,
                                    // maxLength: 10,
                                    decoration: InputDecoration(
                                    errorText: passwordValid ? null : widget.passwordError,
                                    hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                          FormSubmitButton(buttonType: 'SIGN IN',onPressed: _submit,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ],
            ),
          ),
        ),
    );
  }
}

