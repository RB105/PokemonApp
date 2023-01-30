import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container containerHelper(BuildContext context, Color color,double height,double width,Text text) {
  return Container(
    height: MediaQuery.of(context).size.height * height,
    width: MediaQuery.of(context).size.width * width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color
      ),
    child: Center(child: text),
  );
}
