import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/cubit/auth_cubit.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_text_form_field.dart';
import '../../shared/theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Container(
          width: 300,
          height: 300,
          // margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login_tax.png'),
            ),
          ),
        ),
      );
    }

    Widget inputsection() {
      Widget emailinput() {
        return CustomTextFormField(
          title: 'Email Address',
          hinttext: 'Your email address',
          textcolor: kPrimaryColor,
          inputType: TextInputType.emailAddress,
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          controller: emailController,
          lengthInput: 32,
        );
      }

      Widget passwordinput() {
        return CustomTextFormField(
          title: 'Password',
          hinttext: 'Your password',
          textcolor: kPrimaryColor,
          margin: EdgeInsets.only(bottom: 10),
          obscuretext: true,
          controller: passwordController,
          lengthInput: 16,
        );
      }

      Widget forgotpassbutton() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/reset',
            );
          },
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              top: 10,
              // bottom: 73,
            ),
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: kBlackColor, fontSize: 14),
            ),
          ),
        );
      }

      Widget submitbutton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(
                    state.error,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              title: 'Login',
              margin: EdgeInsets.only(top: 60),
              onpressed: () {
                context.read<AuthCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              colorbtn: kPrimaryColor,
              textcolor: kWhiteColor,
            );
          },
        );
      }

      return Container(
        // margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultradius,
          ),
        ),
        child: Column(
          children: [
            emailinput(),
            passwordinput(),
            forgotpassbutton(),
            submitbutton(),
          ],
        ),
      );
    }

    Widget haveaccountbutton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 30,
            // bottom: 73,
          ),
          child: RichText(
            text: TextSpan(
              text: "Don't Have Account?",
              style: TextStyle(color: kBlackColor, fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                    text: ' Sign Up Here!',
                    style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            // image: DecorationImage(
            //   image: AssetImage('assets/background_login.png'),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultmargin,
            ),
            children: [
              title(),
              inputsection(),
              haveaccountbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
