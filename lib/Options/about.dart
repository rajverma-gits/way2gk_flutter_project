import 'package:flutter/material.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/  helper/helperfunction.dart';
import 'package:chat_app/  helper/constant2.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chat_app/  helper/constant.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthMethods authMethods = new AuthMethods();

  @override
  void initState() {
    getUserInfo();
    getEmailInfo();
    getPasswordInfo();
    super.initState();
  }

  getUserInfo() async{
    Constants.myName = await HelperFunction.getUserNameSharedPreference();
    setState(() {

    });
  }

  getEmailInfo() async{
    Constants.myEmail = await HelperFunction.getUserEmailSharedPreference();
    setState(() {

    });
  }

  getPasswordInfo() async{
    Constants.myPassword = await HelperFunction.getUserPasswordSharedPreference();
    setState(() {

    });
  }

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF6C0B8),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoom ()));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "About",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Playfair Display',
                    letterSpacing: 1.5,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Column(
                    children: [
                      Container(
                        height: size.height * 0.7,
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Center(child: Image.asset('assets/Images/19.png',))),
                                SizedBox(
                                  height: 30,
                                ),
                                AutoSizeText(
                                  "WAY2GK, an exclusive platform which provides you the basic information about India. As, we all know in the world full of science and technology we are somewhat lacking in our general knowledge. This app provides you most of the basic information about our country which every Indian should must know.",
                                  style: TextStyle(
                                    fontFamily: 'CormorantGaramond',
                                    fontSize: 20,
                                    color: const Color(0xff47455f),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 10,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "Regards, \nRaj Verma",
                                  style: TextStyle(
                                    fontFamily: 'CormorantGaramond',
                                    fontSize: 20,
                                    color: const Color(0xff47455f),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.005,),
                    ],
                  ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFF6C0B8);
    Path path = Path()
      ..relativeLineTo(0, 230)
      ..quadraticBezierTo(size.width / 2, 300, size.width, 230)
      ..relativeLineTo(0, -230)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}