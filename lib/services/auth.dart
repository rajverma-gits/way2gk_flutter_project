// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/modal/user.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthMethods{

   final FirebaseAuth _auth = FirebaseAuth.instance;

   /// CONDITION ? TRUE : FALSE
   Users _userFromFirebaseUser(User user){
      return user !=null ? Users(userId: user.uid) : null;
   }
   Future signInWithEmailAndPassword(String email, String password) async{
      FirebaseApp defaultApp = await Firebase.initializeApp();
      try{
         UserCredential result = await _auth.signInWithEmailAndPassword
           (email: email, password: password);
         User user = result.user;
         return _userFromFirebaseUser(user);
      }catch(e){
         print(e);
      }
   }

   Future signUpWithEmailAndPassword(String email, String password) async{
      FirebaseApp defaultApp = await Firebase.initializeApp();
      try{
         UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
         User user = result.user;
         return _userFromFirebaseUser(user);
      }catch(e){
         print(e.toString());
      }
   }

   Future resetPass(String email) async{
      FirebaseApp defaultApp = await Firebase.initializeApp();
      try{
         return await _auth.sendPasswordResetEmail(email: email);
      }catch(e){
         print(e.toString());
      }
   }

   Future signOut() async{
      FirebaseApp defaultApp = await Firebase.initializeApp();
      try{
         return await _auth.signOut();
      }catch(e){
      }
   }
}