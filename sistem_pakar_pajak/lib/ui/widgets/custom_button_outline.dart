import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class CustomButtonOutline extends StatelessWidget {
  final String title;
  final double width;
  final Function() onpressed;
  final EdgeInsets margin;

  const CustomButtonOutline({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onpressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      margin: margin,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: kWhiteColor),
              borderRadius: BorderRadius.circular(defaultradius),
            )),
        child: Text(
          'Sign Up',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
