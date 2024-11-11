abstract class AuthCubitStates {}

class InitialAuthCubit extends AuthCubitStates {}


class ChangeObscure extends AuthCubitStates{}

class SuccessSignIn extends AuthCubitStates {}
class LoadingSignIn extends AuthCubitStates {}
class FailureSignIn extends AuthCubitStates {
  final String error;

  FailureSignIn({required this.error});
}


