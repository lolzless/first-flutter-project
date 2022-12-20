// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class section extends StatelessWidget {
  const section({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.framesize,
  }) : super(key: key);

  final String image, title, description;
  final double framesize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * framesize - 10,
      margin: EdgeInsets.only(
        top: 5,
      ),
      child: Column(
        children: [
          Image.asset(image),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 5,
                ),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
