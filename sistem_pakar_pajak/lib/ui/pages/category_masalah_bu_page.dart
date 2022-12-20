import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/cubit/category_bu_cubit.dart';
import 'package:sistem_pakar_pajak/models/category_bu.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/shared/utils_bu.dart';
import 'package:sistem_pakar_pajak/ui/pages/question_page.dart';
import 'package:sistem_pakar_pajak/ui/widgets/categorycard_bu.dart';

class CategoryBadan extends StatefulWidget {
  @override
  State<CategoryBadan> createState() => _CategoryBadanState();
}

class _CategoryBadanState extends State<CategoryBadan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoryBuCubit>().getDataCategory();
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
                child: BlocBuilder<CategoryBuCubit, CategoryBuState>(
                  builder: (context, state) {
                    if (state is CategoryBuSuccess) {
                      return ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            var data = state.categoryBu![index];
                            return CategoryCardBu(
                              category: data,
                              onCardClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuestionPage(
                                      categoryBu: data,
                                      indexQuestion: index,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox();
                          },
                          itemCount: state.categoryBu!.length);
                    } else if (state is CategoryBuFailed) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else if (state is CategoryBuLoading) {
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
