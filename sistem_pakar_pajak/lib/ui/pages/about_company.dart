import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class AboutCompany extends StatefulWidget {
  const AboutCompany({Key? key}) : super(key: key);

  @override
  State<AboutCompany> createState() => _AboutCompanyState();
}

class _AboutCompanyState extends State<AboutCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 24),
          child: buildCoverImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          Text('Tentang Perusahaan',
              style: blackTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 28,
              )),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'CV Pratama Indo Service atau yang lebih dikenal sebagai Pratama Tax ' +
                  'Consultant adalah Kantor Konsultan Pajak yang didirikan di Tangerang. ' +
                  'Bersetifikat resmi sebagai Konsultan Pajak, memiliki izin kuasa hukum ' +
                  'untuk beracara di pengadilan pajak hingga berpengalaman menjadi bagian ' +
                  'dari tim tenaga ahli perpajakan.\n\nPratama Tax Consultant dapat membantu ' +
                  'klien atau wajib pajak (badan usaha ataupun perorangan) dalam hal pemenuhan ' +
                  'hak dan kewajiban perpajakan. Pratama Tax Consultant sekarang berlokasi di ' +
                  'modernland cikokol tepatnya di ruko premier park 2 no 16-17.',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );

  Widget buildCoverImage() => Container(
        color: kGreyColor,
        child: Image.network(
          'https://lh3.googleusercontent.com/p/AF1QipPS8-FYvZmcKjlrteBsboBq76d2uWsUZk2-r9Zu=s2560-w2560-h1202-rw',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );
}
