import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double SMALLGAP(BuildContext context){
  return getScreenHeight(context) * 0.05;
}