import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class titlesection extends StatelessWidget {
  const titlesection({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: defaultmargin),
          height: 28,
          child: Stack(
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
