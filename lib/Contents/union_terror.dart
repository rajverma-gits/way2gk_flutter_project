// @dart=2.9

import 'package:flutter/material.dart';
import 'package:chat_app/Response_to_json/union_territories.dart';
import 'package:chat_app/controller/Union_territories.dart';
import 'package:chat_app/  helper/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FeedbackListScreen4 extends StatelessWidget {
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
                                "Union Territories of India",
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
                                      child: AutoSizeText(
                                        "Small administrative unit",
                                        maxLines: 1,
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
                            )
                          ],
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(bottom: 5, right: 5),
                          padding: EdgeInsets.only(bottom: 20, right: 10),
                          child: Image.asset(
                            "assets/Images/uut.png",
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
            padding: EdgeInsets.only(top: size.height * .32 - 30),
            child: Container(
              height: 700,
              width: 700,
              child: Swiper(
                  itemCount: feedbackItems.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                    DotSwiperPaginationBuilder(activeSize: 10, space: 8, color: Colors.grey, activeColor: Color(0xFFF6C0B8),),
                  ),
                  itemBuilder: (context,index){
                    return Stack(
                      children: [
                        Column(
                          children: [
                            // Padding(
                            //     padding: EdgeInsets.all(10),
                            //     child: Image.network(feedbackItems[index].pic,)),
                            SizedBox(
                              height: size.height * .10,
                            ),
                            Container(
                              height: size.height * .51,
                              width: size.width * .90,
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    height: size.height * .45,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15),
                                            child: Image.network(feedbackItems[index].pic,)),
                                        SizedBox(
                                          height: size.height * .05,
                                        ),
                                        AutoSizeText(
                                          "${feedbackItems[index].name}",
                                          style: TextStyle(
                                            fontFamily: 'CormorantGaramond',
                                            fontSize: 28,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        AutoSizeText(
                                          "Capital: ${feedbackItems[index].capital}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: kLightBlackColor,
                                            fontFamily: 'Playfair Display',
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          "Founded on: ${feedbackItems[index].founded}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: kLightBlackColor,
                                            fontFamily: 'Playfair Display',
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class feedbackItems{
  String pic;
  String name;
  String capital;
  String founded;
  feedbackItems({this.pic, this.name, this.capital, this.founded});
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  const RealEstateItem({Key key,@required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(itemData.pic)),
            ],
          ),
          addVerticalSpace(15),
          Text("${itemData.name}",  style: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 25, color: kBlackColor,
            fontWeight: FontWeight.bold,),),
          addVerticalSpace(5),
          Text("Capital: ${itemData.capital}",  style: TextStyle(fontFamily: 'Playfair Display', fontSize: 15, color: kLightBlackColor,
            fontWeight: FontWeight.w900,),),
          addVerticalSpace(5),
          Text("Founded on: ${itemData.founded}",  style: TextStyle(fontFamily: 'Playfair Display', fontSize: 15, color: kLightBlackColor,
            fontWeight: FontWeight.w900,),),
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
