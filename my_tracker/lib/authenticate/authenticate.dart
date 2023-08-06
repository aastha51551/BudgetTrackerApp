import 'package:flutter/material.dart';
import 'package:my_tracker/authenticate/signin.dart';
import 'package:my_tracker/authenticate/register.dart';
class Authenticate extends StatefulWidget{
  @override
_AuthenticateState createState()=>_AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>{
  bool showsignin=true;
   toggleview(){
    setState(() {
      showsignin= !showsignin;
    });
  }
  @override
  Widget build(BuildContext context){
    if (showsignin){
      return signin(toggleview:toggleview);
    }else {
      return Register(toggleview: toggleview);
    }
    //);
  }
}
