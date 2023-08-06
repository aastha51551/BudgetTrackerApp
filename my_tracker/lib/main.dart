//import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tracker/home/home.dart';
import 'package:my_tracker/services/auth.dart';
import 'package:my_tracker/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(budgeTrackerapp());
}
class budgeTrackerapp extends StatelessWidget{
  const budgeTrackerapp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      //catchError: ()=>null,
      value: authservice().user,
        initialData: null,
        child:MaterialApp(
      title: 'Budget Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Wrapper()
    ));
  }
}
