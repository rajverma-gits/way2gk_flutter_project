// @dart=2.9

import 'package:chat_app/%20%20helper/authenticate.dart';
import 'package:chat_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import '  helper/helperfunction.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:chat_app/widgets/rounded_button.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async{
    await HelperFunction.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'WAY2GK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: kBlackColor,
        ),
      ),
      home: userIsLoggedIn != null ? userIsLoggedIn ? ChatRoom() : Welcome(): Welcome());
  }
}

class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: size.height * .12, left: size.width * .1, right: size.width * .1),
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/bhai2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * .005,
                          ),
                          Container(
                            height: size.height * .18,
                            width: size.width,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "WAY2GK",
                                    style: TextStyle(fontFamily: 'SourceSerifPro', fontSize: 40, fontWeight: FontWeight.bold, backgroundColor: Colors.white70, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: " THE BASIC KNOWLEDGE GATEWAY",
                                    style: TextStyle(fontFamily: 'SourceSerifPro', fontSize: 28, backgroundColor: Colors.white70, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .003,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 15),
                                    blurRadius: 30,
                                    color: Color(0xFF666666).withOpacity(.15),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                    radius: 80.0,
                                    backgroundColor: Colors.white70,
                                    backgroundImage: AssetImage("assets/Images/way.png"),
                                  ),
                              ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .8,
                            child:
                                RoundedButton(
                                  text: "START LEARNING",
                                  fontSize: 20,
                                  press: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Authenticate()));
                                  },
                                ),
                            ),
                          SizedBox(height: size.height *.04),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),),
        ],
    ),
      ),
    );
  }
}
