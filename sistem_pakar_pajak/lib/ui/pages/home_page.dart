import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sistem_pakar_pajak/cubit/category_bu_cubit.dart';
import 'package:sistem_pakar_pajak/main.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';
import 'package:sistem_pakar_pajak/ui/widgets/header.dart';
import 'package:sistem_pakar_pajak/ui/widgets/section.dart';
import 'package:sistem_pakar_pajak/ui/widgets/section_mini.dart';
import 'package:sistem_pakar_pajak/ui/widgets/title_section.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body() {
      Size size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Column(
          children: [
            Header(size: size),
            sectionmini(
              framesize: 0.95,
            ),
            titlesection(title: 'Konsultasi Orang Pribadi'),
            section(
              image: 'assets/image_card1.png',
              title: 'Lingkup Konsultasi',
              description:
                  'Lingkup dari konsultasi ini adalah menganai kewajiban wajib pajak terutama orang pribadi, dalam melaksankan kewajiban sebagai warga Indonesia yang dimana meliputi : EFIN, NPWP, dan SPT Tahunan Orang Pribadi.',
              framesize: 0.95,
            ),
            CustomButton(
              title: 'Mulai',
              width: 200,
              margin: EdgeInsets.only(top: 15),
              onpressed: () {
                Navigator.pushNamed(context, '/categoryop');
              },
              colorbtn: kPrimaryColor,
              textcolor: kWhiteColor,
              height: 35,
              fontsize: 14,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              width: double.infinity,
              height: 6,
              color: kGreyColor.withOpacity(0.4),
            ),
            titlesection(title: 'Konsultasi Badan Usaha'),
            section(
              image: 'assets/image_card2.png',
              title: 'Lingkup Konsultasi',
              description:
                  'Lingkup dari konsultasi ini adalah menganai kewajiban wajib pajak terutama badan usaha, dalam melaksankan kewajiban sebagai warga Indonesia yang dimana meliputi : NPWP, EFIN, PPh 21, PPN, SPT Badan Usaha.',
              framesize: 0.95,
            ),
            CustomButton(
              title: 'Mulai',
              width: 200,
              margin: EdgeInsets.only(
                top: 15,
                bottom: 80,
              ),
              onpressed: () async {
                Navigator.pushNamed(context, '/categorybadan');
              },
              colorbtn: kPrimaryColor,
              textcolor: kWhiteColor,
              height: 35,
              fontsize: 14,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 24,
        title: Text(
          'TAX Pakar',
          style: whiteTextStyle.copyWith(
            fontWeight: extrabold,
          ),
        ),
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
      body: body(),
    );
  }
}
