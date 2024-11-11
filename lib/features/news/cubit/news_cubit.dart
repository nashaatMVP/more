import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/core/api/api_consumer.dart';
import 'package:more/features/news/cubit/news-state.dart';

class NewsCubit extends Cubit<NewsCubitState> {
  NewsCubit(this.api) : super (InitialNewsCubit());

  static NewsCubit get(context) => BlocProvider.of(context);
  final ApiConsumer api;
  var searchController = TextEditingController();

  List<dynamic> articlesList = [];
  void getAllNews() async {
    emit(LoadingNewsCubit());
    final response = await api.get(
      "https://newsapi.org/v2/everything",
      query: {
        "q" : "everything",
        "apiKey" : "324608fa712b4ffca666be43faed2d72",
      },
    );
    articlesList = response["articles"];
    emit(SuccessNewsCubit());
  }


  List<dynamic> searchList = [];
  void getSearch(value) async {
    emit(LoadingSearchCubit());
    final response = await api.get(
      "v2/everything",
      query: {
        "q" : "$value",
        "apiKey" : "324608fa712b4ffca666be43faed2d72",
      },
    );
    searchList = response["articles"];
    emit(SuccessSearchCubit());
  }
}

