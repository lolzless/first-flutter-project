import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/cubit/auth_cubit.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button_outline.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_text_form_field.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController repasswordController =
      TextEditingController(text: '');
  final TextEditingController companynameController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 35),
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon_tax.png'),
            ),
          ),
        ),
      );
    }

    Widget inputsection() {
      Widget nameinput() {
        return CustomTextFormField(
          title: 'Full Name',
          hinttext: 'Your full name',
          textcolor: kWhiteColor,
          inputType: TextInputType.name,
          margin: EdgeInsets.only(bottom: 10),
          controller: nameController,
          fontsize: 16.5,
          lengthInput: 32,
        );
      }

      Widget emailinput() {
        return CustomTextFormField(
          title: 'Email Address',
          hinttext: 'Your email address',
          textcolor: kWhiteColor,
          inputType: TextInputType.emailAddress,
          margin: EdgeInsets.only(bottom: 10),
          controller: emailController,
          fontsize: 16.5,
          lengthInput: 32,
        );
      }

      Widget passwordinput() {
        return CustomTextFormField(
          title: 'Password',
          hinttext: 'Your password',
          textcolor: kWhiteColor,
          margin: EdgeInsets.only(bottom: 10),
          obscuretext: true,
          controller: passwordController,
          fontsize: 16.5,
          lengthInput: 16,
        );
      }

      Widget repasswordinput() {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm Password',
                style: whiteTextStyle.copyWith(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (repasswordController.text != passwordController.text) {
                      return "Password Don't Match";
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  cursorColor: kBlackColor,
                  obscureText: true,
                  controller: repasswordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Confirm Your Password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    fillColor: kWhiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultradius,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget companyinput() {
        return CustomTextFormField(
          title: "Company Name (Optional)",
          hinttext: 'Your company name',
          margin: EdgeInsets.only(bottom: 10),
          textcolor: kWhiteColor,
          inputType: TextInputType.name,
          controller: companynameController,
          fontsize: 16.5,
          lengthInput: 50,
        );
      }

      Widget submitbutton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (passwordController.text != repasswordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(
                    "Password Don't Match",
                  ),
                ),
              );
            } else {
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
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButtonOutline(
                title: 'SignUp',
                width: 252,
                margin: EdgeInsets.only(top: 25),
                onpressed: () {
                  if (passwordController.text == repasswordController.text) {
                    context.read<AuthCubit>().signup(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        companyname: companynameController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: kRedColor,
                        content: Text(
                          "Password Don't Match",
                        ),
                      ),
                    );
                    ;
                  }
                });
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
            nameinput(),
            emailinput(),
            passwordinput(),
            repasswordinput(),
            companyinput(),
            submitbutton(),
          ],
        ),
      );
    }

    Widget haveaccountbutton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            // top: 10,
            bottom: 73,
          ),
          child: RichText(
            text: TextSpan(
              text: "Already Have Account?",
              style: TextStyle(color: kWhiteColor, fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                    text: ' Login Here!', style: TextStyle(color: Colors.red)),
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kSecondaryColor, kPrimaryColor],
            ),
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
