
import 'package:flutter/material.dart';

EdgeInsets paddingValues(String paddingName, context) {

  double swidth = MediaQuery.of(context).size.width;

  switch (paddingName) {
    case "sideMainPadding":
      return EdgeInsets.symmetric(horizontal: swidth *.068);
    case "sideHomePosts":
      return EdgeInsets.symmetric(horizontal: swidth *.052);
    case "sideHomeCards":
      return EdgeInsets.symmetric(horizontal: (swidth*.068) - 30);
    case "sectionPadding":
      if (swidth < 700 ) {
        return EdgeInsets.only(top: 75, bottom: 65);
      } else {
        return EdgeInsets.only(top: 120, bottom: 115);
      }
    case "logo":
      return EdgeInsets.only(top: 24, bottom: 24);
    case "mainTitle":
      if (swidth < 700 ) {
        return EdgeInsets.only(top: 75, bottom: 65);
      } else {
        return EdgeInsets.only(top: 120, bottom: 65);
      }
    case "mainTitleBottom":
      return EdgeInsets.only(bottom: 65);
    case "menuItems":
      return EdgeInsets.only(left: 18);
    case "meuSubItems":
      return EdgeInsets.symmetric(horizontal: 20);
    case "bannerTitle":
      return EdgeInsets.only(bottom: 15);
    case "aboutUsVideo":
      return EdgeInsets.all(30);
    case "underCard":
      return EdgeInsets.only(bottom: 30);
    case "gridTitle":
      return EdgeInsets.only(top: 25, bottom: 15);
    case "fullGrid":
      return EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 35);
    case "blogPostDate":
      return EdgeInsets.only(top: 20, bottom: 15);
    case "blogHomeTile":
      return EdgeInsets.only(top: 10, bottom: 15);
    case "sectionSubTitle":
      return EdgeInsets.only(top: 15, bottom: 10);
    case "carouselTop":
      if (swidth < 700 ) {
        return EdgeInsets.only(top: 75);
      } else {
        return EdgeInsets.only(top: 120);
      }
    case "sliderSubtitle":
      return EdgeInsets.only(top: 30, bottom: 20);
    case "partners":
      return EdgeInsets.symmetric(vertical: 50);
    case "footer":
      return EdgeInsets.only(top: 75, left: 75, right: 75, bottom: 30);
    default:
      return EdgeInsets.zero;
  }
}
