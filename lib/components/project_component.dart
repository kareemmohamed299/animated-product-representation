import 'package:flutter/material.dart';
// text
Widget myText ({
  required String text ,
  required double fontSize ,
  required String fontFamily ,
  required Color textColor ,
  required FontWeight fontWeight ,
  double ? letterSpacing })
{
  return Text(text,style: TextStyle(
      fontSize: fontSize ,
      fontFamily: fontFamily,
      color: textColor,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing
  ),);
}
// images
Widget images({
  required double bottomPosition ,
  required double leftPosition ,
  required String imagePath ,
  required double imageWidth ,
  required double imageHeight })
{
  return  Positioned(
    bottom: bottomPosition,
    left: leftPosition,
    child: Image.asset(imagePath,width: imageWidth ,height:imageHeight,fit: BoxFit.contain,),
  );
}
// animatedContainer
Widget animatedContainer({
  required EdgeInsetsGeometry padding ,
  required  double containerHeight ,
  required double containerWidth ,
  required String imagePath1 ,
  required double image1Width ,
  required double image1Height,
  required String imagePath2 ,
  required double image2Width ,
  required double image2Height })
{
  return AnimatedContainer(
      padding: padding/*EdgeInsets.only(left:width*0.01),*/,
      curve: Curves.easeInCubic,
      height: containerHeight ,
      width:containerWidth,
      duration: Duration(milliseconds: 1000),
      child: Stack(children:[
        Image.asset(imagePath1,height: image1Height , width:image1Width,fit: BoxFit.contain),
        Positioned(
            top: 5,
            left: 60,
            child: Image.asset(imagePath2, height: image2Height ,width:image2Width,fit: BoxFit.contain,)),
      ])
  );
}
Widget leftContainer(double size,String text) {
  return Stack(
    children: [
      //1- Container
      Positioned(
        top: 0,
        left:0,
        child:Center(
          child: Container(
            height: size-(size*1.2/size),
            width:5.1*size,
            padding: EdgeInsets.only(left:size*0.4 , top: size*0.1 ),
            decoration:BoxDecoration(
                color: Color(0xFFbacce8),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(size),bottomLeft:Radius.circular(size) )
            ),
            child: Align(
              alignment:Alignment.centerLeft ,
              child: Text(text,style:TextStyle(
                  fontSize: size*0.7 ,
                  fontFamily: "MyriadPro",
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
            ),

          ),
        ),
      ),
      //2- first curve
      Positioned(
        top: 0,
        left:size*5,
        child:Transform(
          transform:makeMatrix2(size),
          child: ClipPath(
            clipper: myclipper2(),
            child: Container(
              height: size-(size*1.1/size),
              width:3*size,
              decoration:BoxDecoration(
                color:Color(0xFFbacce8),

              ),
            ),
          ),
        ),
      ),
      //3- second curve
      Positioned(
        top: 0,
        left:4*size+size/3,
        child: Transform.rotate(
          origin: Offset(0,4),
          angle: 3.14,
          child: Transform(
            transform: makeMatrix2(size+size*0.3),
            child: Center(
              child: ClipPath(
                clipper: myclipper1(),
                child: Container(
                  height: size,
                  width:size*3,
                  decoration:BoxDecoration(
                      color: Color(0xFF6e9bd1),
                      borderRadius: BorderRadius.circular(size)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
Widget midContainer(double size,String text) {
  return Stack(
    children: [
      //1- first curve
      Positioned(
        top: 0,
        left:0,
        child: Center(
          child: ClipPath(
            clipper: myclipper1(),
            child: Container(
              height: size,
              width:size*3,
              decoration:BoxDecoration(
                  color: Color(0xFF6e9bd1),
                  borderRadius: BorderRadius.circular(size)
              ),

            ),
          ),
        ),
      ),
      //2- second curve
      Positioned(
        top: 0,
        left:-size+size/3,
        child:Transform.rotate(
          angle: -3.15,
          child: Center(
            child: ClipPath(
              clipper: myclipper2(),
              child: Container(
                height: size-(size*0.9/size),
                width:size*3,
                decoration:BoxDecoration(
                  color: Color(0xFF4288c7),
                ),

              ),
            ),
          ),
        ),
      ),
      //3- Container
      Positioned(
        top: 0,
        left:size*1.75,
        child:Center(
          child: Container(
            height: size-(size*1.4/size),
            width:13*size,
            decoration:BoxDecoration(
              color:Color(0xFF4288c7),
            ),
            child: Align(
              alignment:Alignment.center ,
              child: Text(text,style:TextStyle(
                  fontSize: size*0.7 ,
                  fontFamily: "MyriadPro",
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),),
            ),

          ),
        ),
      ),
      //4- third curve
      Positioned(
        top: 0,
        left:size*14.5,
        child:Center(
          child: ClipPath(
            clipper: myclipper2(),
            child: Container(
              height: size-(size*1.1/size),
              width:3*size,
              decoration:BoxDecoration(
                color: Color(0xFF4288c7),
              ),

            ),
          ),
        ),
      ),
      // 5- last curve
      Positioned(
        top: 0,
        left:13.5*size+size/3,
        child: Transform.rotate(
          angle: -3.15,
          child: Center(
            child: ClipPath(
              clipper: myclipper1(),
              child: Container(
                height: size,
                width:size*3,
                decoration:BoxDecoration(
                    color: Color(0xFFbacce8),
                    borderRadius: BorderRadius.circular(200)
                ),
              ),
            ),
          ),
        ),
      ),


    ],
  );
}
Widget rightContainer(double size,String text) {
  return Stack(
    children: [
      //1- first curve
      Positioned(
        top: 0,
        left:0,
        child: Center(
          child: ClipPath(
            clipper: myclipper1(),
            child: Container(
              height: size,
              width:size*3,
              decoration:BoxDecoration(
                  color: Color(0xFFbacce8),
                  borderRadius: BorderRadius.circular(size)
              ),

            ),
          ),
        ),
      ),
      //2- second curve
      Positioned(
        top: 0,
        left:-size+size/3,
        child:Transform.rotate(
          angle: -3.15,
          child: Center(
            child: ClipPath(
              clipper: myclipper2(),
              child: Container(
                height: size-(size*0.9/size),
                width:size*3,
                decoration:BoxDecoration(
                  color: Color(0xFF88acd9),
                ),

              ),
            ),
          ),
        ),
      ),
      //3- Container
      Positioned(
        top: 0,
        left:size*1.7,
        child:Center(
          child: Container(
            padding: EdgeInsets.only(top: size*0.1 ),
            height: size-(size*1.4/size),
            width:6.3*size,
            decoration:BoxDecoration(
                color: Color(0xFF88acd9),
                borderRadius: BorderRadius.only(topRight: Radius.circular(size), bottomRight: Radius.circular(size))
            ),
            child:  Align(
              alignment:Alignment.centerLeft ,
              child: Text(text,style:TextStyle(
                  fontSize: size*0.7 ,
                  fontFamily: "MyriadPro",
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
            ),

          ),
        ),
      ),

    ],
  );
}
// shape of curve 1
class myclipper1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.quadraticBezierTo(size.width*0.1,size.height*0.1,size.width*0.009,size.height*0.001);
    path0.cubicTo(size.width*-0.1,size.height,size.width*0.01,size.height,size.width*0.1,size.height);
    path0.cubicTo(size.width*0.28,size.height*1.04,size.width*0.31,size.height*0.70,size.width*0.34,size.height*0.55);
    path0.quadraticBezierTo(size.width*0.4,size.height*0.1,size.width*0.5,size.height*0.02);
    path0.close();
    return path0;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
// shape of curve 2
class myclipper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.cubicTo(size.width*-1,size.height,size.width*0.01,size.height,size.width*0.1,size.height);
    path0.cubicTo(size.width*0.28,size.height*1.04,size.width*0.31,size.height*0.7,size.width*0.34,size.height*0.55);
    path0.quadraticBezierTo(size.width*0.4,size.height*0.1,size.width*0.5,size.height*0.02);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
// matrix to rotate shape
Matrix4 makeMatrix2(double size) {
  Matrix4 matrix =  new Matrix4.translationValues(0.0, size-1, 0.0);
  matrix.rotateX(3.14);
  return matrix;
}