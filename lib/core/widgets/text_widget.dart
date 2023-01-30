import 'package:flutter/material.dart';

 Text textHelper(String sign,Color color, double size, String data, FontWeight bold) {
  return Text("$sign$data",
    style: TextStyle(fontSize: size, color: color, fontWeight: bold),
  );
}
