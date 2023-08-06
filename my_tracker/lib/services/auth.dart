import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:my_tracker/models/user.dart' ;
import 'package:my_tracker/services/database.dart';
class authservice{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  MyUser? _userfromfirebaseuser(User? user){
    return user != null ? MyUser(uid: user.uid):null;
  }
  Stream<MyUser?> get user{
    return _auth.authStateChanges()
        .map((User? user) => _userfromfirebaseuser(user));
  }

  Future signinwithemail(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userfromfirebaseuser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

Future registerwithemail(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      await DatabaseService(uid: user?.uid).updateUserData([]);
      return _userfromfirebaseuser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
}

Future signOut() async {
    try{
      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;

    }
}}