// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:sistem_pakar_pajak/models/database/databasehelper.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/pages/history_page.dart';

class ShowHistory extends StatelessWidget {
  final History history;
  const ShowHistory({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: kGreyColor,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/solution_banner.png'),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: kWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150, right: 150),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  width: 10,
                  height: 2,
                  color: kGreyColor.withOpacity(0.4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 15,
                    right: 30,
                    left: 30,
                  ),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: HtmlWidget('''${history.solusi}''')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
