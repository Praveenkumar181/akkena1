

import 'package:akkenna/Image_Path.dart';
import 'package:flutter/material.dart';

import '../commancolors.dart';

Widget buildCustomContainer(BuildContext context, String text, String text1, {Color textColor = Colors.black, Color fixedTextColor = Colors.black}) {
  return Container(
    margin: EdgeInsets.only(right: 5, left: 5),
    width: MediaQuery.of(context).size.width / 4,
    height: MediaQuery.of(context).size.height / 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: grey1,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 5),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight:FontWeight.w500 ,
              letterSpacing: 1
            ),
          ),
        ),
        SizedBox(height: 5),

        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right:47),
          child: Text(
            text1,
            style: TextStyle(
              color: fixedTextColor, // Use the provided fixedTextColor
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    ),
  );
}
Widget buildCustomContainer2({
  required BuildContext context,
  required String text,
  required String pathPNG,
}) {
  return Container(
    margin: EdgeInsets.only(right: 5, left: 5),
    width: MediaQuery.of(context).size.width / 1.7,
    height: MediaQuery.of(context).size.height / 7,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: white1,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5),
          child: Container(
            height: 30,
            width: 50,
            child: ImgPathPng(pathPNG), // Assuming imagePath is a local asset path
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "Nulla semper accumsan magna etultrices. Aenean at varius purus. Nulla egestas semper tellus.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color:grey4)
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


