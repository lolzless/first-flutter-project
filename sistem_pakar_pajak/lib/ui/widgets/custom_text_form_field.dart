import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hinttext;
  final bool obscuretext;
  final TextEditingController controller;
  final Color textcolor;
  final EdgeInsets margin;
  final double fontsize;
  final int lengthInput;
  final TextInputType inputType;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hinttext,
    this.obscuretext = false,
    required this.controller,
    required this.textcolor,
    required this.lengthInput,
    this.margin = EdgeInsets.zero,
    this.fontsize = 18,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              color: textcolor,
              fontSize: fontsize,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 45,
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(lengthInput),
              ],
              cursorColor: kBlackColor,
              obscureText: obscuretext,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintText: hinttext,
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
}
