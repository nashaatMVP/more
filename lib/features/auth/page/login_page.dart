import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/constants/constants.dart';
import 'package:more/constants/custom_scaffoldMsg.dart';
import 'package:more/constants/custom_text.dart';
import 'package:more/constants/custom_textfield.dart';
import 'package:more/constants/scaffold_body.dart';
import 'package:more/features/auth/cubit/auth_cubit.dart';
import 'package:more/features/auth/cubit/auth_states.dart';
import 'package:more/features/auth/page/register_page.dart';
import 'package:more/root_page.dart';
import '../../../constants/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthCubitStates>(
      listener: (context,state) {
        if(state is SuccessSignIn){
          successMsg(context, "Login Successful");
          Navigator.push(context, MaterialPageRoute(builder: (c) => const RootPage()));
        }
      },
      builder: (context,state) {
        var cubit = AuthCubit.get(context);
        return ScaffoldBody(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.transparent,
            body: Form(
              key: cubit.formKeyLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kHeight40,
                  kHeight40,
                  kHeight40,
                  TextWidgets.heading("Login",fontSize: 40),
                  kHeight40,
                  CustomTextField(
                    controller: cubit.emailLoginController,
                    obscureText: false,
                    validateMsg: "InValid Email",
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  kHeight20,
                  CustomTextField(
                    controller: cubit.passwordLoginController,
                    obscureText: cubit.isObscure,
                    validateMsg: "InValid Password",
                    hintText: "Password",
                    keyboardType: TextInputType.number,
                    eyeIcon: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                         cubit.changeObscure();
                      },
                      icon: Icon(
                        cubit.isObscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye ,color: Colors.black,),
                    ),
                  ),
                  kHeight100,
                  state is LoadingSignIn ? const CircularProgressIndicator() : CustomButton(
                    text: "Log In",
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                    borderColor: primaryColor,
                    onTap: () {
                        cubit.signIn();
                      },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
