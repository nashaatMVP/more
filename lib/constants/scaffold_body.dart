import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/core/api/dio_consumer.dart';
import 'package:more/core/cubit/app_cubit.dart';
import 'package:more/core/cubit/app_states.dart';
import 'package:more/features/news/cubit/news-state.dart';
import 'package:more/features/news/cubit/news_cubit.dart';
import '../constants/constants.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final List<double>? stops;

  const ScaffoldBody({
    super.key,
    required this.child,
    this.padding = kHorizontal10,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppCubitStates>(
      listener: (context , state) => {},
      builder: (context , state)  {
        var cubit = AppCubit.get(context);
        return Container(
          padding: padding,
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:  [
                cubit.isChanged ? Colors.yellow.withOpacity(0.9) : Colors.black.withOpacity(0.6),
                cubit.isChanged ? Colors.yellow.withOpacity(0.9) : Colors.black.withOpacity(0.9),
                cubit.isChanged ? Colors.white : Colors.black12,
                cubit.isChanged ? Colors.white : Colors.white12,
              ],
              stops: stops,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: child,
        );
      },
    );
  }
}