import 'package:flutter/material.dart';
import 'package:news_app/layout/business/business.dart';
import 'package:news_app/layout/entertianment/entertianment.dart';
import 'package:news_app/layout/health/health.dart';
import 'package:news_app/layout/science/science.dart';
import 'package:news_app/layout/sports/sports.dart';
import 'package:news_app/layout/technology/technology.dart';

List<String> appBar=["Business","Entertainment","Health","Science","Sports","Technology"];
List<Widget> screens=const[Business(),Entertainment(),Health(),Science(),Sports(),Technology()];
//-----------------------------------------
var currentIndex=0;
//-----------------------------------------
List<dynamic> business=[];
List<dynamic> entertainment=[];
List<dynamic> health=[];
List<dynamic> science=[];
List <dynamic>sports=[];
List<dynamic>technology=[];
List<dynamic>search=[];
//-----------------------------------------
String? keyOfSearch;
//-----------------------------------------
Map models= {
  'Egypt':'eg',
  'Ukraine':'ua',
  'India': 'in',
  'Japan': 'jp',
  'Nigeria':'ng',
  'United States':'us',
  'Saudi Arabia':'sa',
  'South Africa':'za',
  'South Korea':'kr',
  'Netherlands':'nl',
};

