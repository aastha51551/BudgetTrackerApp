import 'package:flutter/material.dart';
import 'package:my_tracker/authenticate/authenticate.dart';
import 'package:my_tracker/home/home.dart';
import 'package:my_tracker/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<MyUser?>(context);
    if (user==null){
      return Authenticate();
    }else {
      return homepage();
    }
  }
}
