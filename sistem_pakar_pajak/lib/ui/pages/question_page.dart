import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/cubit/solusi_op_cubit.dart';
import 'package:sistem_pakar_pajak/models/category_bu.dart';
import 'package:sistem_pakar_pajak/models/category.dart';
import 'package:sistem_pakar_pajak/models/solusi_op.dart';
import 'package:sistem_pakar_pajak/models/subcategory.dart';
import 'package:sistem_pakar_pajak/models/subcategory_bu.dart';
import 'package:sistem_pakar_pajak/shared/algorithm/solusi_algo.dart';
import 'package:sistem_pakar_pajak/shared/algorithm/solusi_algo_bu.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/pages/solution_page.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';

class QuestionPage extends StatefulWidget {
  final CategoryBu? categoryBu;
  final Category? categoryOp;
  final SolusiOp? solusiOp;
  final int indexQuestion;
  const QuestionPage({
    Key? key,
    this.categoryBu,
    this.categoryOp,
    this.solusiOp,
    required this.indexQuestion,
  }) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int indexSub = 0;
  List<String> kode = [];
  SubCategory? catOp;
  String? title;
  SubCategoryBu? catBu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.categoryOp != null) {
      title = widget.categoryOp!.name;
      catOp = widget.categoryOp!.subCategories![0];
    } else {
      title = widget.categoryBu!.name;
      catBu = widget.categoryBu!.subCategories![0];
    }
  }

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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: kGreyColor,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                          left: 10,
                          right: 10,
                        ),
                        child: Text(
                          (widget.categoryBu == null)
                              ? catOp!.pertanyaan!
                              : catBu!.pertanyaan!,
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 75,
                  right: 75,
                ),
                child: Row(
                  children: [
                    CustomButton(
                        title: 'Yes',
                        width: 75,
                        onpressed: () {
                          if (widget.categoryOp != null) {
                            if (catOp!.isTrue!.isEnd!) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => SolutionPage(
                                      title: title!,
                                      kodeLanjutan:
                                          catOp!.isTrue!.kodeLanjutan!,
                                      // kodeLanjutan: widget
                                      //     .categoryOp!
                                      //     .subCategories![indexSub]
                                      //     .isTrue!
                                      //     .kodeLanjutan!,
                                    ),
                                  ),
                                  (Route<dynamic> route) => false);
                            } else {
                              setState(() {
                                catOp = SolusiAlgo().matchingKode(
                                    widget.categoryOp!.subCategories!,
                                    catOp!.isTrue!.kodeLanjutan!);
                              });
                            }
                          } else if (widget.categoryBu != null) {
                            if (catBu!.isTrue!.isEnd!) {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SolutionPage(
                              //       isOp: false,
                              //       title: title!,
                              //       kodeLanjutan: catBu!.isTrue!.kodeLanjutan!,
                              //     ),
                              //   ),
                              // );
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => SolutionPage(
                                      title: title!,
                                      isOp: false,
                                      kodeLanjutan:
                                          catBu!.isTrue!.kodeLanjutan!,
                                    ),
                                  ),
                                  (Route<dynamic> route) => false);
                            } else {
                              setState(() {
                                catBu = SolusiAlgoBu().matchingKode(
                                    widget.categoryBu!.subCategories!,
                                    catBu!.isTrue!.kodeLanjutan!);
                              });
                            }
                          }
                        },
                        colorbtn: kPrimaryColor,
                        textcolor: kWhiteColor),
                    Spacer(),
                    CustomButton(
                        title: 'No',
                        width: 75,
                        onpressed: () {
                          if (widget.categoryOp != null) {
                            if (catOp!.isFalse!.isEnd!) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => SolutionPage(
                                      title: title!,
                                      kodeLanjutan:
                                          catOp!.isFalse!.kodeLanjutan!,
                                    ),
                                  ),
                                  (Route<dynamic> route) => false);
                            } else {
                              setState(() {
                                catOp = SolusiAlgo().matchingKode(
                                    widget.categoryOp!.subCategories!,
                                    catOp!.isFalse!.kodeLanjutan!);
                              });
                            }
                          } else if (widget.categoryBu != null) {
                            if (catBu!.isFalse!.isEnd!) {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SolutionPage(
                              //       isOp: false,
                              //       title: title!,
                              //       kodeLanjutan: catBu!.isFalse!.kodeLanjutan!,
                              //     ),
                              //   ),
                              // );
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => SolutionPage(
                                      title: title!,
                                      isOp: false,
                                      kodeLanjutan:
                                          catBu!.isFalse!.kodeLanjutan!,
                                    ),
                                  ),
                                  (Route<dynamic> route) => false);
                            } else {
                              setState(() {
                                catBu = SolusiAlgoBu().matchingKode(
                                    widget.categoryBu!.subCategories!,
                                    catBu!.isFalse!.kodeLanjutan!);
                              });
                            }
                          }
                        },
                        colorbtn: kPrimaryColor,
                        textcolor: kWhiteColor),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/question_banner.png'),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              // color: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
