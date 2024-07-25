import 'package:chat_app/core/Widgets/customElevatedButton.dart';
import 'package:chat_app/core/Widgets/customShowDialog.dart';
import 'package:chat_app/core/Widgets/customTextFormField.dart';
import 'package:chat_app/core/Widgets/snackBarMessage.dart';
import 'package:chat_app/core/auth/cubit.dart';
import 'package:chat_app/core/auth/cubit_state.dart';
import 'package:chat_app/core/services/route.dart';
import 'package:chat_app/core/utils/constant.dart';
import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:chat_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          snackBarSuccessMessage(context, state.SuccessMessage);
          GotoPushReplacement(const LoginView(), context);
        } else if (state is RegisterErrorState) {
          print(state.ErrorMessage);
          snackBarErrorMessage(context, state.ErrorMessage);
        } else {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: GetColors.kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const Gap(80),
                  SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        Image.asset(GetImages.kPrimaryImage),
                        Text(
                          'Scholar Chat',
                          style: getWhitePacificoFont(size: 40),
                        ),
                      ],
                    ),
                  ),
                  const Gap(80),
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: getWhiteFont(
                            size: 30, fontweight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    emailController: emailController,
                    labelText: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    emailController: passwordController,
                    labelText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  // CustomTextFormField(
                  //   emailController: confirmPasswordController,
                  //   labelText: 'Confirm Password',
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'This Field is required';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const Gap(20),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: 'Register',
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).registerAuth(
                                passwordController.text, emailController.text);
                          }
                        },
                      )),
                  const Gap(10),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' You Have an Account? Sign In',
                        style: getWhiteFont(
                            size: 15, color: const Color(0xffC7EDE6)),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
