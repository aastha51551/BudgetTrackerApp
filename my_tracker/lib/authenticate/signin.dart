import 'package:flutter/material.dart';
import 'package:my_tracker/services/auth.dart';
import 'package:my_tracker/services/loading.dart';
class signin extends StatefulWidget {
  //const signin({super.key});
  final  toggleview;
  signin({required this.toggleview});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {

  final authservice _auth=authservice();
  final _formkey=GlobalKey<FormState>();
  bool loading=false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        actions: [
          ElevatedButton(
              onPressed: (){
                widget.toggleview();
              },
              child: Container(
                child: Text('Register'),
              ))
        ],
      ),
      body: ListView(children:[Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 25,),
              Text('Login to My Tracker',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 40

              ),),
              SizedBox(height: 25,),
              Image.asset('images/icon.jpg'),

              SizedBox(height: 25),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email ID'
                ),
                validator: (val)=>(val?.isEmpty ?? true) ? 'Enter an Email':null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });

                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your password'
                ),
                validator: (val)=>(val?.isEmpty ?? true) ? 'Enter a Password with at least six characters':null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });

                },
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                  onPressed: () async{
                    if(_formkey.currentState?.validate()??false){
                      setState(() {
                        loading=true;
                      });
                      dynamic result=await _auth.signinwithemail(email, password);
                      if(result==null){
                        setState(() {
                          error='The Email or Password is incorrect';
                          loading=false;
                        });
                      }
                    }


                  },
                  child: Container(
                    child: Text('Sign In')
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),),
              SizedBox(height: 20,),
              Text(error)
            ],
          ),
        ),
      )]),
    );
  }
}
