import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Response_to_json/Cheif_minister.dart';
import 'package:chat_app/controller/Cheif_minister.dart';
import 'package:chat_app/  helper/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/  helper/const.dart';
import 'package:chat_app/  helper/top_10_data.dart';
import 'dart:math' as math;
import 'package:chat_app/Contents/Top-10/highway_top10.dart';
import 'package:chat_app/Contents/Top-10/bridge_top10.dart';
import 'package:chat_app/Contents/Top-10/river_top10.dart';

class FeedbackListScreen9 extends StatelessWidget {
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
                              margin: EdgeInsets.only(top: size.height * .025),
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Top 10 Longest",
                                style: TextStyle(fontFamily: 'SourceSerifPro', fontSize: 28, fontWeight: FontWeight.bold),
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
                                      padding: EdgeInsets.only(top: size.height * .02),
                                      child: Text(
                                        "Highways, Rivers & Bridges in India.",
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
                          margin: EdgeInsets.only(bottom: 5),
                          color: Colors.transparent,
                          child: Image.asset(
                            "assets/Images/top10.png",
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: size.height * .32 - 12),
              child: Column(
                children: [
                  MovieCarousel(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackItems{
  String sr;
  String question;
  String answer;
  FeedbackItems({this.sr, this.question, this.answer});
}

class MovieCarousel extends StatefulWidget {

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: tops.length,// we have 3 demo movies
          itemBuilder: (context, index) => buildMovieSlider(index),//MovieCard(movie: movies[index]),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0;
      if (_pageController.position.haveDimensions) {
        value = index - _pageController.page;
        // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
        // we use clamp so that our value vary from -1 to 1
        value = (value * 0.038).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: Duration(milliseconds: 350),
        opacity: initialPage == index ? 1 : 0.4,
        child: Transform.rotate(
          angle: math.pi * value,
          child: MovieCard(top: tops[index]),
        ),
      );
    },
  );
}

class MovieCard extends StatelessWidget {
  final Top top;

  const MovieCard({Key key, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: (){
          if (top.name == "Highway") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedbackListScreenHighway()));
          }
          else if(top.name == "Bridge")
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedbackListScreenBridge()));
          }
          else if(top.name == "River")
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedbackListScreenRiver()));
          }
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(top.poster),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.030),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  top.name,
                  style: TextStyle(fontFamily: 'SourceSerifPro', fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





