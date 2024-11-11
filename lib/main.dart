import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/constants/constants.dart';
import 'package:more/core/api/dio_consumer.dart';
import 'package:more/core/cubit/app_cubit.dart';
import 'package:more/features/auth/cubit/auth_cubit.dart';
import 'package:more/features/auth/page/login_page.dart';
import 'package:more/features/news/cubit/news_cubit.dart';
import 'package:more/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthCubit(DioConsumer(dio: Dio()))),
        BlocProvider(create: (context) => NewsCubit(DioConsumer(dio: Dio()))..getAllNews()),
      ],
      child: MaterialApp(
        title: 'More',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme:  const AppBarTheme(
            backgroundColor: Colors.transparent,
            toolbarHeight: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemStatusBarContrastEnforced: false,
              statusBarColor: Colors.transparent,
              systemNavigationBarDividerColor:  Colors.black,
              systemNavigationBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          useMaterial3: true,
        ),
        home: const RootPage(),
      ),
    );
  }
}
