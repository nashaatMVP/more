import 'package:flutter/material.dart';
import 'package:more/features/news/page/news_page.dart';
import 'package:more/features/news/page/profile-page.dart';
import '../../constants/constants.dart';

List<Widget> screens = [
  const NewsPage(),
   ProfilePage(),
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 17; //17
    case 1:
      return AppSizes.blockSizeHorizontal * 57;
    default:
      return 0;
  }
}


final List<Color> gradient = [
  Colors.yellow.withOpacity(0.8),
  Colors.yellow.withOpacity(0.5),
  Colors.transparent,
];



class SampleWidget extends StatelessWidget {
  const SampleWidget({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Place Content of $label Tab Here",
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 222, 222, 222),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}