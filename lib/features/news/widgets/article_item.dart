import 'package:flutter/material.dart';
import 'package:more/core/cubit/app_cubit.dart';
import 'package:more/features/news/cubit/news_cubit.dart';
import '../../../constants/constants.dart';
import '../../../constants/custom_text.dart';


Widget ArticleItem(dynamic article,context) =>  Material(
  elevation: 10,
  shadowColor: Colors.yellow.withOpacity(0.6),
  borderRadius: BorderRadius.circular(15),
  child: AnimatedContainer(
    // width: 250,
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOut,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Image.network(
              article["urlToImage"] ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo9ezdCdokB6T3bcILDYZmp7f0d9drhA8aiQ&s",
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
            child: TextWidgets.bodyText2(
              article["title"] ?? "Error 404 Not Found",
              color: Colors.black,
              fontSize: 17,
              maxLines: 2,
            ),
          ),
        ],
      ),
    ),
  ),
);