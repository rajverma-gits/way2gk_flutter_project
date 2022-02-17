// @dart=2.9

import 'package:flutter/material.dart';
import 'package:chat_app/Response_to_json/facts.dart';
import 'package:chat_app/controller/Facts.dart';
import 'package:chat_app/  helper/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/widgets/animator.dart';

class FeedbackListScreen8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Feedback Responses',
        home: FeedbackListPage("Responses"));
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage(this.title);

  final String title;
  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {

  bool isLoading = true;

  List<FeedbackForm> feedbackItems = List<FeedbackForm>();

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading ? Container(
          child: Center(child: CircularProgressIndicator(color: Color(0xFFF6C0B8),))
      ) : Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: size.height * .10, left: size.width * .1, right: size.width * .02),
              height: size.height * .30,
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
                              margin: EdgeInsets.only(top: size.height * .005),
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Interesting Facts",
                                style: TextStyle(fontFamily: 'SourceSerifPro', fontSize: 28, fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * .4,
                                      padding: EdgeInsets.only(top: size.height * .02),
                                      child: Text(
                                        "About India",
                                        maxLines: 5,
                                        style: TextStyle(
                                          fontSize: 15,
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
                          margin: EdgeInsets.only(right: 5, bottom: 10),
                          color: Colors.transparent,
                          child: Image.asset(
                            "assets/Images/facts.png",
                            height: double.infinity,
                            alignment: Alignment.topRight,
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * .32 - 12),
            child: Container(
              child: ListView.builder(
                  itemCount: feedbackItems.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Animator(Card(
                        elevation: 5.0,
                        child: Container(
                          //width: size.width * .60,
                          child: ListTile(
                            title: Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      child: Text("${feedbackItems[index].sr}.", style: TextStyle(fontFamily: 'Hahmlet', fontSize: 20, color: kBlackColor,
                                        fontWeight: FontWeight.bold,),)),
                                  SizedBox(width: 16),
                                  Container(
                                    width: size.width * .55,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(feedbackItems[index].name, style: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 20, color: kBlackColor,
                                          fontWeight: FontWeight.bold,),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ), Duration(microseconds: 540 + index)),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

showDialogFunc(context, img, name, state)
{
  return showDialog(
      context: context,
      builder: (context){
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 320,
              child: Wrap(
                children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(img, width: 200, height: 200),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      state,
                      style: TextStyle(
                        fontSize: 18,
                        color: kLightBlackColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                ],
              ),
            ),
          ),
        );
      }
  );
}
