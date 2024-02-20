import 'package:flutter/cupertino.dart';


// PNG IMAGE PATH
Widget ImgPathPng(String pathPNG){
  return  Image(image: AssetImage("lib/assets/${pathPNG}"));
}


// SVG IMAGE PATH



// Logo Image



//CANDIDATE IMAGE

Widget Candidate_Img({required String ImgPath}){
  return  Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage("lib/assets/$ImgPath"),
            fit: BoxFit.cover
        )
    ),
  );
}

// PROFILE IMG
Widget profileImg({required String ProfileImg}){
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 20,bottom: 11),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(image: AssetImage('lib/assets/${ProfileImg}'))
      ),
    ),
  );
}
