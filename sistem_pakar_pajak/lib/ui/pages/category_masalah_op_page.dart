import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/cubit/category_op_cubit.dart';
import 'package:sistem_pakar_pajak/models/category.dart';
import 'package:sistem_pakar_pajak/services/category_op_services.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/shared/utils.dart';
import 'package:sistem_pakar_pajak/ui/pages/question_page.dart';
import 'package:sistem_pakar_pajak/ui/widgets/categorycard.dart';
import 'package:provider/provider.dart';
import 'package:sistem_pakar_pajak/services/category_op_services.dart';

class CategoryOp extends StatefulWidget {
  @override
  State<CategoryOp> createState() => _CategoryOpState();
}

class _CategoryOpState extends State<CategoryOp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoryOpCubit>().getDataCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(),
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
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Pilihan Kategori Masalah',
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(),
                ),
              ),
              Expanded(
                child: BlocBuilder<CategoryOpCubit, CategoryOpState>(
                  builder: (context, state) {
                    if (state is CategoryOpSuccess) {
                      return ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            var data = state.categoryOp![index];
                            return CategoryCard(
                              category: data,
                              onCardClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuestionPage(
                                        categoryOp: data, indexQuestion: index),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox();
                          },
                          itemCount: state.categoryOp!.length);
                    } else if (state is CategoryOpFailed) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else if (state is CategoryOpLoading) {
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
              )
            ],
          ),
        ));
  }
}
