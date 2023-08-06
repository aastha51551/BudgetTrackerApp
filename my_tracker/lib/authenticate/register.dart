import 'package:flutter/material.dart';
import 'package:my_tracker/services/auth.dart';
import 'package:my_tracker/services/loading.dart';
class Register extends StatefulWidget {
  //const Register({super.key});
final  toggleview;
 Register({required this.toggleview});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authservice _auth=authservice();
  final _formkey=GlobalKey<FormState>();
  bool loading =false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: [
          ElevatedButton(
              onPressed: (){
                widget.toggleview();
              },
              child: Column(
                  children:[
                    Icon(Icons.person),
                    Container(
                child: Text('Sign In'),
              )]))
        ],),
      body: ListView(children:[Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
              image: AssetImage('images/icon2.jpg'),
          fit: BoxFit.fill),
        ),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 25,),
              Text('Sign Up!',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
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
                  hintText: 'Enter a password(Atleast six characters)'
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
                      dynamic result=await _auth.registerwithemail(email, password);
                      if(result==null){
                        setState(() {
                          error='Enter a valid Email/password';
                          loading=false;
                        });
                      }
                    }

                  },
                  child: Container(
                      color: Colors.green,
                      child: Text('Register')
                  ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
              SizedBox(height: 20,),
              Text(error)
            ],
          ),
        ),
      )]),
    );
  }
}
