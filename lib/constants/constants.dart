import 'package:flutter/material.dart';


// Colors
const Color primaryColor = Colors.yellow;
// Widgets height
const double kAppBarHeight = 72;
const double kNavBarHeight = 72.33;

// Constant Empty Height
const kHeight3 = SizedBox(height: 3);
const kHeight5 = SizedBox(height: 5);
const kHeight10 = SizedBox(height: 10);
const kHeight15 = SizedBox(height: 15);
const kHeight20 = SizedBox(height: 20);
const kHeight25 = SizedBox(height: 25);
const kHeight30 = SizedBox(height: 30);
const kHeight35 = SizedBox(height: 35);
const kHeight40 = SizedBox(height: 40);
const kHeight45 = SizedBox(height: 45);
const kHeight50 = SizedBox(height: 50);
const kHeight55 = SizedBox(height: 55);
const kHeight75 = SizedBox(height: 75,);
const kHeight100 = SizedBox(height: 100);

// Constant Empty Width
const kWidth4 = SizedBox(width: 4);
const kWidth5 = SizedBox(width: 5);
const kWidth7 = SizedBox(width: 7.5);
const kWidth10 = SizedBox(width: 10);
const kWidth15 = SizedBox(width: 15);
const kWidth20 = SizedBox(width: 20);
const kWidth25 = SizedBox(width: 25);
const kWidth30 = SizedBox(width: 30);
const kWidth35 = SizedBox(width: 35);
const kWidth40 = SizedBox(width: 40);
const kWidth45 = SizedBox(width: 45);
const kWidth50 = SizedBox(width: 50);
const kWidth55 = SizedBox(width: 55);

/* <------ Margin or Padding ------> */

// Constant All Margin or Padding Values
const kAll5 = EdgeInsets.all(5);
const kAll10 = EdgeInsets.all(10);
const kAll15 = EdgeInsets.all(15);
const kAll20 = EdgeInsets.all(20);
const kAll30 = EdgeInsets.all(30);

// Constant Vertical Margin or Padding Values
const kVertical10 = EdgeInsets.symmetric(vertical: 10);
const kVertical15 = EdgeInsets.symmetric(vertical: 15);
const kVertical20 = EdgeInsets.symmetric(vertical: 20);
const kVertical30 = EdgeInsets.symmetric(vertical: 30);

// Constant Horizontal Margin or Padding Values
const kHorizontal10 = EdgeInsets.symmetric(horizontal: 10);
const kHorizontal15 = EdgeInsets.symmetric(horizontal: 15);
const kHorizontal20 = EdgeInsets.symmetric(horizontal: 20);
const kHorizontal25 = EdgeInsets.symmetric(horizontal: 25);
const kHorizontal30 = EdgeInsets.symmetric(horizontal: 30);
const kHorizontal35 = EdgeInsets.symmetric(horizontal: 35);
const kHorizontal40 = EdgeInsets.symmetric(horizontal: 40);

//symmetric padding
kSymmetric({double? h, double? v}) =>
    EdgeInsets.symmetric(horizontal: h ?? 0.0, vertical: v ?? 0.0);

konly({double? l, double? r, double? t, double? b}) => EdgeInsets.only(
    left: l ?? 0.0, right: r ?? 0.0, top: t ?? 0.0, bottom: b ?? 0.0);

//screen height
sHeight(context) => MediaQuery.of(context).size.height;
//screen width
sWidth(context) => MediaQuery.of(context).size.width;


class AppSizes {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}