// @dart=2.9

import 'package:flutter/material.dart';
import 'package:chat_app/Response_to_json/First/defence.dart';
import 'package:chat_app/controller/India first/controller_defence.dart';
import 'package:chat_app/widgets/animator.dart';
import 'package:chat_app/  helper/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/Contents/India_first/India_first.dart';

class FeedbackListScreenDefence extends StatelessWidget {
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
                                alignment: Alignment.centerLeft,
                                //padding: EdgeInsets.symmetric(horizontal: 16),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: (){
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackListScreen6()));
                                    });
                                  },
                                )),
                            Container(
                              margin: EdgeInsets.only(top: size.height * .025),
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Defence",
                                style: TextStyle(fontFamily: 'SourceSerifPro', fontSize: 28, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 30, right: 15),
                          color: Colors.transparent,
                          child: Image.asset(
                            "assets/Images/defencei.jpg",
                            height: double.infinity,
                            alignment: Alignment.topRight,
                            fit: BoxFit.fitWidth,
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
                                      child: Text(feedbackItems[index].sr, style: TextStyle(fontFamily: 'Hahmlet', fontSize: 20, color: kBlackColor,
                                        fontWeight: FontWeight.bold,),)),
                                  SizedBox(width: 16),
                                  Container(
                                    width: size.width * .55,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(feedbackItems[index].question, style: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 20, color: kBlackColor,
                                          fontWeight: FontWeight.bold,),),
                                        SizedBox(height: 4,),
                                        Text("${feedbackItems[index].answer}", style: TextStyle(fontFamily: 'Playfair Display', fontSize: 17, color: kLightBlackColor,
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
