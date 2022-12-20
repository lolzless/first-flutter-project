import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_text_form_field.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final TextEditingController emailController = TextEditingController(text: '');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text('Password Reset Email Sent')));
      FocusScope.of(context).unfocus();
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: kRedColor, content: Text(e.message!)));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 24,
        // elevation: 0,
        title: Text(
          'Reset Password',
          style: whiteTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [kSecondaryColor, kPrimaryColor],
            ),
          ),
        ),
      ),
      body: Container(
        color: kWhiteColor,
        padding: EdgeInsets.all(24),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/reset_pass.png'),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: defaultmargin,
              right: defaultmargin,
            ),
            child: CustomTextFormField(
              title: 'Email Address',
              hinttext: 'Your email address',
              textcolor: kPrimaryColor,
              inputType: TextInputType.emailAddress,
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              controller: emailController,
              lengthInput: 32,
            ),
          ),
          Container(
            width: 150,
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: CustomButton(
                title: "Send Request",
                onpressed: resetPass,
                colorbtn: kPrimaryColor,
                textcolor: kWhiteColor),
          ),
        ]),
      ),
    );
  }
}
