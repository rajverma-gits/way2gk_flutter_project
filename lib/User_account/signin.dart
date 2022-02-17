// @dart=2.9

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/%20%20helper/helperfunction.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:chat_app/User_account/forgetpassword.dart';
import '../home/home.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);



  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  bool isLoading = false;
  QuerySnapshot snaphotUserInfo;

  signIn(){
     if(formKey.currentState.validate()){

       HelperFunction.saveUserEmailSharedPreference(emailTextEditingController.text);

       //TODO: Function to get user details
       databaseMethods.getUserByUserEmail(emailTextEditingController.text)
           .then((val){
         snaphotUserInfo = val;
         HelperFunction
             .saveUserNameSharedPreference(snaphotUserInfo.docs[0].data());
         HelperFunction.saveUserEmailSharedPreference(emailTextEditingController.text);
         HelperFunction.saveUserPasswordSharedPreference(passwordTextEditingController.text);
         //print("${snaphotUserInfo.docs[0].data()} this is not good");
       });

       setState(() {
         isLoading = true;
       });

       authMethods.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val){
         if(val != null) {

           HelperFunction.saveUserLoggedInSharedPreference(true);
           Navigator.pushReplacement(context, MaterialPageRoute(
               builder: (context) => ChatRoom()
           ),);
         }
       });




     }
  }
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: [Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child:
                        Wrap(
                          children: [Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: size.height * .45, left: size.width * .1, right: size.width * .01),
                          height: size.height * .48,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Images/lo.png"),
                              fit: BoxFit.fitHeight,),
                          ),
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (val){
                                      return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                          ? null
                                          : "Please Enter a valid Email id";
                                    },
                                    controller: emailTextEditingController,
                                    style: simpleTextStyle(),
                                    decoration: textFieldDecoration("Email"),
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    validator: (val) {
                                      return val.length > 6
                                          ? null
                                          : "Enter Password 6+ characters";
                                    },
                                    controller: passwordTextEditingController,
                                    style: simpleTextStyle(),
                                    decoration: textFieldDecoration("Password"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height*.005,
                            ),
                            Wrap(
                              children: [ Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ForgotPassword()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Text(
                                          "Forgot Password?",
                                          style: simpleTextStyle(),
                                        )),
                                  )
                                ],
                              ),
                    ],
                            ),
                            SizedBox(
                              height: size.height *.05,
                            ),
                            Wrap(
                              children: [GestureDetector(
                                onTap: (){
                                  signIn();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6C0B8),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text("Sign In", style: mediumTextStyle(),),
                                ),
                              ),
                    ],
                            ),
                            Wrap(
                              children: [Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text("Don't have an account? ", style: TextStyle(color: Colors.black,
                                     fontSize: 15,),),
                                  GestureDetector(
                                    onTap: (){
                                      widget.toggle();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical:8.0),
                                      child: Text("Register now", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        decoration: TextDecoration.underline
                                      ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    ],
                            ),
                            SizedBox(height: size.height *.04),
                          ],
                      ),
                    ],
                        ),
                  ),
                    ),
        ],
                ),
        ),
    );
  }
}
