import 'package:flutter/cupertino.dart';
import 'package:sistem_pakar_pajak/main.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button_outline.dart';
import '../../shared/theme.dart';

void main() => runApp(MyApp());

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kSecondaryColor, kPrimaryColor],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 125,
                  height: 125,
                  margin: EdgeInsets.only(bottom: 65),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_tax.png'),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image_get_started.png'),
                    ),
                  ),
                ),
                CustomButtonOutline(
                  title: 'Sign-Up',
                  width: 292,
                  margin: EdgeInsets.only(bottom: 20),
                  onpressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-up', (route) => false);
                  },
                ),
                CustomButton(
                  title: 'Login',
                  width: 292,
                  margin: EdgeInsets.only(bottom: 80),
                  onpressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  colorbtn: kWhiteColor,
                  textcolor: kPrimaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
