import 'package:flutter/material.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/  helper/helperfunction.dart';
import 'package:chat_app/  helper/constant2.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chat_app/  helper/constant.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      '${Constants.myName}',
                      style: TextStyle(
                        fontFamily: 'SourceSerifPro',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.black54,
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(Icons.email, color: Colors.black87,),
                          title: AutoSizeText('${Constants.myEmail}', style: TextStyle(color: Colors.black87, fontSize: 15.0), maxLines: 1,),
                        )
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.key , color: Colors.black87,),
                        title: Text('${Constants.myPassword}', style: TextStyle(color: Colors.black87, fontSize: 15.0),),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 25.0),
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
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
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/Images/user.png'),
                  ),
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
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}