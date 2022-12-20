import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width, height, fontsize;
  final Function() onpressed;
  final EdgeInsets margin;
  final Color colorbtn, textcolor;

  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onpressed,
    this.margin = EdgeInsets.zero,
    required this.colorbtn,
    required this.textcolor,
    this.height = 45,
    this.fontsize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
            backgroundColor: colorbtn,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultradius),
            )),
        child: Text(
          title,
          style: purpleTextStyle.copyWith(
            color: textcolor,
            fontSize: fontsize,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
