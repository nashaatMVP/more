import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/core/cubit/app_states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(InitialAppCubitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isChanged = false;

  void changeTheme () {
    isChanged = !isChanged;
    emit(ChangeThemeCubitState());
  }

}