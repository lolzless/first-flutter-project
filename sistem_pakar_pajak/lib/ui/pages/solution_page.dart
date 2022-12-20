import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sistem_pakar_pajak/cubit/solusi_bu_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/solusi_op_cubit.dart';
import 'package:sistem_pakar_pajak/models/category_bu.dart';
import 'package:sistem_pakar_pajak/models/category.dart';
import 'package:sistem_pakar_pajak/models/database/databasehelper.dart';
import 'package:sistem_pakar_pajak/models/solusi_bu.dart';
import 'package:sistem_pakar_pajak/models/solusi_op.dart';
import 'package:sistem_pakar_pajak/models/sub_solusi_op.dart';
import 'package:sistem_pakar_pajak/shared/algorithm/solusi_algo.dart';
import 'package:sistem_pakar_pajak/shared/algorithm/solusi_algo_bu.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/pages/history_page.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';

class SolutionPage extends StatefulWidget {
  final bool isOp;
  final String? kodeLanjutan, title;
  const SolutionPage({
    Key? key,
    this.isOp = true,
    this.title,
    this.kodeLanjutan,
  }) : super(key: key);

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  int indexSub = 0;
  String jawaban = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SolusiOpCubit>().getDataCategory();
    context.read<SolusiBuCubit>().getDataCategory();
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
//jika isOp=true, get Data Op
                child: (widget.isOp)
                    ? BlocBuilder<SolusiOpCubit, SolusiOpState>(
                        builder: (context, state) {
                          if (state is SolusiOpSuccess) {
                            List<SolusiOp> solusiOp = state.solusiOp!;
                            String hasilSolusi = SolusiAlgo()
                                .getSolusi(solusiOp, widget.kodeLanjutan!);
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 5,
                                  right: 30,
                                  left: 30,
                                ),
                                child: HtmlWidget(
                                    // solusiOp[0].subCategories![0].solusi!,
                                    // data: """${hasilSolusi}""",
                                    // textAlign: TextAlign.justify,
                                    """${hasilSolusi}"""),
                              ),
                            );
                          } else if (state is SolusiOpFailed) {
                            return Center(
                              child: Text(state.error),
                            );
                          } else if (state is SolusiOpLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Center(
                              child: Text("Data Kosong"),
                            );
                          }
                        },
                      )
                    : BlocBuilder<SolusiBuCubit, SolusiBuState>(
                        builder: (context, state) {
                          if (state is SolusiBuSuccess) {
                            List<SolusiBu> solusiBu = state.solusiBu!;
                            String hasilSolusi = SolusiAlgoBu()
                                .getSolusi(solusiBu, widget.kodeLanjutan!);
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 5,
                                  right: 20,
                                  left: 20,
                                ),
                                child: HtmlWidget("""${hasilSolusi}"""),
                              ),
                            );
                          } else if (state is SolusiBuFailed) {
                            return Center(
                              child: Text(state.error),
                            );
                          } else if (state is SolusiBuLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Center(
                              child: Text("Data Kosong"),
                            );
                          }
                        },
                      ),
              ),
              SizedBox(
                child: (widget.isOp)
                    ? BlocBuilder<SolusiOpCubit, SolusiOpState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              left: 130,
                              right: 130,
                            ),
                            child: CustomButton(
                                title: 'Selesai',
                                width: 50,
                                onpressed: () async {
                                  if (state is SolusiOpSuccess) {
                                    List<SolusiOp> solusiOp = state.solusiOp!;
                                    String hasilSolusi = SolusiAlgo().getSolusi(
                                        solusiOp,
                                        widget.kodeLanjutan!.toString());

                                    await DatabaseHelper.instance.add(History(
                                      name: widget.title!,
                                      solusi: hasilSolusi,
                                      dateTime:
                                          DateTime.now().millisecondsSinceEpoch,
                                    ));
                                  }
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/main', (route) => false);
                                },
                                colorbtn: kPrimaryColor,
                                textcolor: kWhiteColor),
                          );
                        },
                      )
                    : BlocBuilder<SolusiBuCubit, SolusiBuState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              left: 130,
                              right: 130,
                            ),
                            child: CustomButton(
                                title: 'Selesai',
                                width: 50,
                                onpressed: () async {
                                  if (state is SolusiBuSuccess) {
                                    List<SolusiBu> solusiBu = state.solusiBu!;
                                    String hasilSolusi = SolusiAlgoBu()
                                        .getSolusi(solusiBu,
                                            widget.kodeLanjutan!.toString());

                                    await DatabaseHelper.instance.add(History(
                                      name: widget.title!,
                                      solusi: hasilSolusi,
                                      dateTime:
                                          DateTime.now().millisecondsSinceEpoch,
                                    ));
                                  }
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/main', (route) => false);
                                },
                                colorbtn: kPrimaryColor,
                                textcolor: kWhiteColor),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
