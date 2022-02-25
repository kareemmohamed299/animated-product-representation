import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'animation/mid.dart';
import 'animation/right.dart';
import 'animation/left.dart';
import 'components/project_component.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
List<String>leftText=["Urea 10%","Lavander Oil","Coconut Oil","Olive Oil","Sun Flower Oil","Shea Butter","Tea Tree Oil"];
List<String>midText=["Pentavitin","Pro Lipid 141","Panthenol","SK - Influx (Ceramides)","Vitamin E","Hydrogen Aquaporin (Glyceryl Glucoside)"];
List<String>rightText=["Polyquaternium-67","Chamomile Extract"];
class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{
  double containerHeight=0 , containerWidth=0 ;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    Timer(Duration(milliseconds: 1000),(){setState(() {
      containerHeight=height*0.52;
      containerWidth=width*0.18;
     });});
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children:[
                //head page
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: height*0.02 ,),
                  child: Row(
                    children: [
                      Container(
                        height:height/3.8,
                        width: width-height/3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.start ,
                              children: [
                                // left head image
                                Padding(
                                  padding:  EdgeInsets.only(left:width*0.06 , bottom: height*0.03 ),
                                  child: Image.asset("assets/images/logo.png",height: height*0.15,width: height*0.15,fit: BoxFit.cover),
                                ),
                                // Text in head of page
                                Padding(
                                  padding:  EdgeInsets.only(left: width*0.25),
                                  child: Column(
                                    children:  [
                                      myText(text: "SEAL ... SHIELD ... FEEL", fontSize: height*0.03, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w600),
                                      Container(
                                        height:height*0.085  ,
                                        child:  myText(text: "SOLODEX", fontSize: height*0.09, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w800),
                                      ),
                                      myText(text: "SOLO MASTERPIECE", fontSize: height*0.028, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w100,letterSpacing: 10),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: width*0.02),
                              child: Container(
                                  height: height*0.056,
                                  padding:  EdgeInsets.only(left:width*0.385,top:height*0.0009 ),
                                  width:width-height/3.5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4288c7),
                                  ),
                                  child:myText(text: "HYDRACTIV", fontSize: height*0.056, fontFamily: "MyriadPro", textColor: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 5)
                              ),)
                          ],
                        ),
                      ),
                      //left head image
                      Padding(
                          padding:  EdgeInsets.only(right:width*0.009),
                          child: Image.asset("assets/images/1.jpeg",height: height/3.8,width:height/3.5 ,fit: BoxFit.cover,)),
                    ],
                  ),
                ),
                // body page
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    // left animated image
                    animatedContainer(
                        padding:EdgeInsets.only(left:width*0.01) ,
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                        imagePath1:"assets/images/m1.png" ,
                        image1Height:height*0.52  ,
                        image1Width: width*0.18,
                        imagePath2: "assets/images/HYDRACTIV UREA CREAM 01.jpg",
                        image2Width: width*0.11,
                        image2Height: height*0.5),
                    // mid page body
                    Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        // text in mid page
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:width*0.052,bottom: height*0.05,top: height*0.03 ),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  myText(text: "SOLODEX", fontSize: height*0.03, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w800),
                                  myText(text: "HYDRACTIV UREA CREAM", fontSize: height*0.03, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w800),
                                  myText(text: "For Dry And Very Dry Skin", fontSize: height*0.025, fontFamily: "MyriadPro", textColor: Colors.black, fontWeight: FontWeight.w400)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:width*0.096,bottom: height*0.05,top: height*0.03),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  myText(text: "SOLODEX", fontSize: height*0.03, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w800),
                                  myText(text: "HYDRACTIV CLEANSER", fontSize: height*0.03, fontFamily: "MyriadPro", textColor: Color(0xFF4288c7), fontWeight: FontWeight.w800),
                                  myText(text: "For Dry And Very Dry Sensitive Skin", fontSize: height*0.025, fontFamily: "MyriadPro", textColor: Colors.black, fontWeight: FontWeight.w400)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:EdgeInsets.only(top:height*0.04 ) ,
                              height: 8* height*0.04,width: width*0.14,
                              child: ListView.builder(itemBuilder:(context , index)=>
                                LeftWidgetANimator(Container(height: height*0.04,width:width*0.14, child: leftContainer(height*0.035,leftText[index])),1000,),
                                itemCount: leftText.length,
                              ),
                            ),
                             Container(
                              height: 6* height*0.04,width: width*0.315,
                              child: ListView.builder(itemBuilder:(context , index)=>
                                MidWidgetANimator(Container(height:height*0.04,width:width*0.315, child: midContainer(height*0.035,midText[index])),1000,),
                                itemCount: midText.length,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top:height*0.04 ) ,
                              height: 6* height*0.04,width: width*0.15,
                              child: ListView.builder(itemBuilder:(context , index)=>
                                  RightWidgetANimator( Container(height:height*0.04,width:width*0.15, child: rightContainer(height*0.035,rightText[index])),1000),
                                itemCount: rightText.length,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    // right animated image
                    animatedContainer(
                        padding:EdgeInsets.only(right: width*0.01) ,
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                        imagePath1:"assets/images/m2.png" ,
                        image1Height:height*0.52  ,
                        image1Width: width*0.18,
                        imagePath2: "assets/images/HYDRACTIV CLEANSER 01.jpg",
                        image2Width: width*0.11,
                        image2Height: height*0.5),
                  ],
                ),
              ]
          ),
            images(bottomPosition: 0, leftPosition:width*0.17,imagePath: "assets/images/2.jpeg", imageWidth:width*0.15 , imageHeight:height*0.15),
            images(bottomPosition: height*0.04, leftPosition: width*0.32,imagePath: "assets/images/3.jpeg", imageWidth: width*0.154, imageHeight:  height*0.154),
            images(bottomPosition:  height*0.08, leftPosition: width*0.49, imagePath: "assets/images/4.jpeg",imageWidth: width*0.158, imageHeight: height*0.158),
            images(bottomPosition:  height*0.12, leftPosition: width*0.65,imagePath: "assets/images/5.jpeg", imageWidth: width*0.18, imageHeight: height*0.18),
          ]
        ),
      ),
    );
  }
}

//


