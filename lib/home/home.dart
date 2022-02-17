// @dart=2.9

import 'package:chat_app/%20%20helper/constant2.dart';
import 'package:chat_app/%20%20helper/helperfunction.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Contents/cheif_ministers.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/  helper/constant2.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:chat_app/Options/about.dart';
import 'package:chat_app/Options/profile.dart';
import 'package:chat_app/Contents/state%20&%20capitals.dart';
import 'package:chat_app/Contents/neighbour%20country.dart';
import 'package:chat_app/Contents/union_terror.dart';
import 'package:chat_app/Contents/national_symbols.dart';
import 'package:chat_app/Contents/India_first/India_first.dart';
import 'package:chat_app/Contents/Indian_laws.dart';
import 'package:chat_app/Contents/Interesting_facts.dart';
import 'package:chat_app/Contents/Top-10/India_top_10.dart';
import 'package:chat_app/Contents/prime_minister.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  bool isDrawerOpen = false;
  double value=0;

  AuthMethods authMethods = new AuthMethods();

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async{
    Constants.myName = await HelperFunction.getUserNameSharedPreference();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFDF7F8),
                  Color(0xFFF6C0B8),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
            ),
          ),

          SafeArea(
              child: Container(
                width: 200.0,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage("assets/Images/user.png"),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            AutoSizeText("${Constants.myName}",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Playfair Display',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: (){
                                setState(() {
                                  isDrawerOpen = false;
                                  value == 0 ? value = 1 : value = 0;
                                });
                            },
                            leading: Icon(Icons.home, color: Colors.black,),
                            title: Text("Home", style: TextStyle(
                              color: Colors.black,
                            ),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                            },
                            leading: Icon(Icons.person, color: Colors.black,),
                            title: Text("Profile", style: TextStyle(
                              color: Colors.black,
                            ),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            leading: Icon(FontAwesomeIcons.infoCircle, color: Colors.black,),
                            title: Text("About", style: TextStyle(
                              color: Colors.black,
                            ),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              authMethods.signOut();
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                            },
                            leading: Icon(Icons.logout, color: Colors.black,),
                            title: Text("Logout", style: TextStyle(
                              color: Colors.black,
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

          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_,double val,__){
                return(
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi/6) * val),
                  child: Scaffold(
                    body:
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(top: size.height * .10, left: size.width * .1, right: size.width * .02),
                                height: size.height * .40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/Images/bg.png"),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                                child: Container(
                                  child: Flex(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    direction: Axis.horizontal,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: GestureDetector(
                                                      onTap: (){
                                                        setState(() {
                                                          value == 0 ? value = 1 : value = 0;
                                                          isDrawerOpen = true;
                                                        });
                                                      },
                                                      child: isDrawerOpen ? IconButton(
                                                         icon: Icon(Icons.arrow_back_ios),
                                                        onPressed: (){
                                                           setState(() {
                                                             isDrawerOpen = false;
                                                             value == 0 ? value = 1 : value = 0;
                                                           });
                                                        },
                                                      ) : Icon(Icons.menu))),
                                              SizedBox(height: size.height * .015),
                                              Container(
                                                margin: EdgeInsets.only(top: size.height * .005),
                                                alignment: Alignment.centerLeft,
                                                child: AutoSizeText(
                                                  "Hi, ${Constants.myName} !!",
                                                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: size.width * .4,
                                                        height: size.height * .15,
                                                        padding: EdgeInsets.only(top: size.height * .02, bottom: size.height * .02),
                                                        child: Text(
                                                          "Welcome to WAY2GK the basic knowledge gateway.",
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: kLightBlackColor,
                                                            fontFamily: 'Playfair Display',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 25),
                                            color: Colors.transparent,
                                            child: Image.asset(
                                              "assets/Images/19.png",
                                              height: double.infinity,
                                              alignment: Alignment.topRight,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: size.height * .40 - 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen9()));
                                      },
                                      child: ChapterCard(
                                        name: "Top 10 Longest",
                                        chapterNumber: 4,
                                        tag: "Highways, Rivers & Bridges in India",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen2()));
                                      },
                                      child: ChapterCard(
                                        name: "State & Capitals",
                                        chapterNumber: 2,
                                        tag: "The city of a political subdivision",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen()));
                                      },
                                      child: ChapterCard(
                                        name: "Cheif Ministers",
                                        chapterNumber: 1,
                                        tag: "The leader of state",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen4()));
                                      },
                                      child: ChapterCard(
                                        name: "Union Territories of India",
                                        chapterNumber: 4,
                                        tag: "Small administrative unit",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen3()));
                                      },
                                      child: ChapterCard(
                                        name: "Neighbouring Countries",
                                        chapterNumber: 3,
                                        tag: "Bordering countries of India",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen5()));
                                      },
                                      child: ChapterCard(
                                        name: "National Symbols",
                                        chapterNumber: 4,
                                        tag: "National symbols of India",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen7()));
                                      },
                                      child: ChapterCard(
                                        name: "Indian Laws & Rights",
                                        chapterNumber: 4,
                                        tag: "One must know",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen6()));
                                      },
                                      child: ChapterCard(
                                        name: "India's First",
                                        chapterNumber: 4,
                                        tag: "Static general knowledge",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen10()));
                                      },
                                      child: ChapterCard(
                                        name: "Prime Ministers",
                                        chapterNumber: 4,
                                        tag: "List of Prime ministers of India",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => FeedbackListScreen8()));
                                      },
                                      child: ChapterCard(
                                        name: "Interesting Facts",
                                        chapterNumber: 4,
                                        tag: "About India",
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
              })
        ],
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;

  const ChapterCard({
    this.name = 'abs',
    this.tag = '',
    this.chapterNumber = 0,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: size.width * .50,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$name \n",
                    style: TextStyle(
                      fontSize: 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: tag,
                    style: TextStyle(color: kLightBlackColor),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}