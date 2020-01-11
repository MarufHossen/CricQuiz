import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [
  Category(1,"General Knowledge", icon: FontAwesomeIcons.globeAsia),
  Category(2,"Guess The Player", icon: FontAwesomeIcons.personBooth),
  Category(3,"Guess The Team", icon: FontAwesomeIcons.objectGroup),
  Category(4,"Franchise Cricket", icon: FontAwesomeIcons.bowlingBall),
  Category(5,"Head To Head", icon: FontAwesomeIcons.fire),
  Category(6,"Leaderboard", icon: Icons.equalizer),
  // Category(15,"Video Games", icon: FontAwesomeIcons.gamepad),
  // Category(16,"Board Games", icon: FontAwesomeIcons.chessBoard),
  // Category(17,"Science & Nature", icon: FontAwesomeIcons.microscope),
  // Category(18,"Computer", icon: FontAwesomeIcons.laptopCode),
  // Category(19,"Maths", icon: FontAwesomeIcons.sortNumericDown),
  // Category(20,"Mythology"),
  // Category(21,"Sports", icon: FontAwesomeIcons.footballBall),
  // Category(22,"Geography", icon: FontAwesomeIcons.mountain),
  // Category(23,"History", icon: FontAwesomeIcons.monument),
  // Category(24,"Politics"),
  // Category(25,"Art", icon: FontAwesomeIcons.paintBrush),
  // Category(26,"Celebrities"),
  // Category(27,"Animals", icon: FontAwesomeIcons.dog),
  // Category(28,"Vehicles", icon: FontAwesomeIcons.carAlt),
  // Category(29,"Comics"),
  // Category(30,"Gadgets", icon: FontAwesomeIcons.mobileAlt),
  // Category(31,"Japanese Anime & Manga"),
  // Category(32,"Cartoon & Animation"),
];