class NewsCubitState {}


class InitialNewsCubit extends NewsCubitState {}

class SuccessNewsCubit extends NewsCubitState {}
class LoadingNewsCubit extends NewsCubitState {}
class FailureNewsCubit extends NewsCubitState {
  final String error;

  FailureNewsCubit({required this.error});

}


class SuccessSearchCubit extends NewsCubitState {}
class LoadingSearchCubit extends NewsCubitState {}


