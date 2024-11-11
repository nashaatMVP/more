import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/core/api/api_consumer.dart';
import 'package:more/core/errors/exceptions.dart';
import 'package:more/features/auth/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthCubitStates> {
  AuthCubit(this.apiConsumer) : super(InitialAuthCubit());

  static AuthCubit get(context) => BlocProvider.of(context);
  final ApiConsumer apiConsumer;
  bool isObscure = false;
  Key formKeyLogin = GlobalKey<FormState>();
  Key formKeyRegister = GlobalKey<FormState>();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void dispose() {
    emailLoginController.dispose();
    passwordLoginController.dispose();
    emailRegisterController.dispose();
    passwordRegisterController.dispose();
    nameController.dispose();
  }

  changeObscure() {
    isObscure = !isObscure;
    emit(ChangeObscure());
  }

  signIn () async{
    try {
      emit(LoadingSignIn());
      final response = await apiConsumer.post(
        "https://drivys.api.mvp-apps.ae/api/consumer/auth/login",
        data: {
          "email" : emailLoginController.text,
          "password" : passwordLoginController.text
        },
      );
      emit(SuccessSignIn());
    } on ServerException catch (e) {
      emit(FailureSignIn(error: e.errModel.errorMessage));
    }
  }

}