import 'package:chat_app/core/Widgets/customElevatedButton.dart';
import 'package:chat_app/core/Widgets/customShowDialog.dart';
import 'package:chat_app/core/Widgets/customTextFormField.dart';
import 'package:chat_app/core/Widgets/snackBarMessage.dart';
import 'package:chat_app/core/auth/cubit.dart';
import 'package:chat_app/core/auth/cubit_state.dart';
import 'package:chat_app/core/services/email_valid.dart';
import 'package:chat_app/core/services/route.dart';
import 'package:chat_app/core/utils/constant.dart';
import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool isLoadingShowing = false;
    bool isVisible = true;
    var formKey = GlobalKey<FormState>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (isLoadingShowing) {
            Navigator.pop(context); // اغلاق صندوق التحميل
            isLoadingShowing = false;
          }

          snackBarSuccessMessage(context, state.SuccessMessage);
          GotoPushReplacement(const HomeView(), context);
          print(state.SuccessMessage);
        } else if (state is LoginErrorState) {
          if (isLoadingShowing) {
            Navigator.pop(context); // اغلاق صندوق التحميل
            isLoadingShowing = false;
          }
          Navigator.pop(context);
          snackBarErrorMessage(context, state.ErrorMessage);

          print(state.ErrorMessage);
        } else if (state is LoginLoadingState) {
          if (isLoadingShowing) {
            Navigator.pop(context); // اغلاق صندوق التحميل
            isLoadingShowing = true;
          }
          showLoadingDialog(context);
        } else {
          const Center(
            child: Text('There is an error Please try again'),
          );
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
                        'Sign in',
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
                      } else if (emailValidate(value) == false) {
                        return 'Please Eneter a valid email';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  CustomTextFormField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          isVisible = !isVisible;
                        },
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white,
                        )),
                    unVisible: isVisible,
                    emailController: passwordController,
                    labelText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field is required';
                      } else if (value.length < 7) {
                        return 'Enter 7 characters at leaset';
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: 'Sign in',
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().loginAuth(
                                passwordController.text, emailController.text);

                            // GotoPush(const RegisterView(), context);
                          }
                        },
                      )),
                  const Gap(10),
                  TextButton(
                      onPressed: () {
                        GotoPush(const RegisterView(), context);
                      },
                      child: Text(
                        'Don\'t Have an Account? Sign up',
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
