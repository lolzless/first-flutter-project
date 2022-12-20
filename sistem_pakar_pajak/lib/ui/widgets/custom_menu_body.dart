import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class CustomMenuBody extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomMenuBody({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.only(
        left: defaultmargin,
        right: defaultmargin,
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(title),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
