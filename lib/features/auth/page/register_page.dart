import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more/constants/constants.dart';
import 'package:more/constants/custom_button.dart';
import 'package:more/constants/custom_container.dart';
import 'package:more/constants/custom_textfield.dart';
import 'package:more/constants/scaffold_body.dart';
import 'package:more/features/auth/cubit/auth_cubit.dart';
import 'package:more/features/auth/cubit/auth_states.dart';
import 'package:more/root_page.dart';

import '../../../constants/custom_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthCubitStates>(
      listener: (context , state) {},
      builder: (context , state) {
        var cubit = AuthCubit.get(context);
        return ScaffoldBody(
          // stops: const [0.3, 0.1, 0.5,0.2],
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
              key: cubit.formKeyRegister,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    kHeight75,
                    TextWidgets.heading("Register",fontSize: 40),
                    kHeight20,
                    Material(
                      shadowColor: Colors.black,
                      elevation: 20,
                      borderRadius: BorderRadius.circular(39),
                      child: const CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59PcOodbdbcdDU9GiOPgntKpbCREadMs69g&s"),
                        ),
                      ),
                    ),
                    kHeight20,
                    CustomTextField(
                      controller: cubit.nameController,
                      obscureText: true,
                      validateMsg: "Name is InValid",
                      hintText: "Name",
                      keyboardType: TextInputType.name,
                    ),
                    kHeight20,
                    CustomTextField(
                        controller: cubit.emailRegisterController,
                        obscureText: true,
                        validateMsg: "Email is InValid",
                        hintText: "Email",
                      keyboardType: TextInputType.emailAddress,

                    ),
                    kHeight20,
                    CustomTextField(
                        controller: cubit.passwordRegisterController,
                        obscureText: cubit.isObscure,
                        validateMsg: "Password is InValid",
                      keyboardType: TextInputType.number,

                        hintText: "Password",
                        eyeIcon: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            cubit.changeObscure();
                          },
                          icon: Icon(cubit.isObscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye ,color: Colors.black,),
                        ),
                    ),
                    kHeight40,
                    kHeight40,
                    CustomButton(
                        text: "Create Account",
                        textColor: Colors.white,
                        buttonColor: primaryColor,
                        borderColor: primaryColor,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (c) => const RootPage()));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
