import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

Future<void>? _launched;

Future<void> _launchInWebViewOrVC(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'}),
  )) {
    throw 'Could not launch $url';
  }
}

class _AboutMeState extends State<AboutMe> {
  final double coverheight = 280;
  final double profileheight = 144;

  final Uri toLaunch =
      Uri(scheme: 'https', host: 'www.facebook.com', path: 'lolzless');
  final Uri toLaunch1 =
      Uri(scheme: 'https', host: 'www.instagram.com', path: 'ardiferdinan_');
  final Uri toLaunch2 =
      Uri(scheme: 'https', host: 'www.github.com', path: 'lolzless');
  final Uri toLaunch3 =
      Uri(scheme: 'https', host: 'www.twitter.com', path: 'ardiferdinan_');

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
          margin: EdgeInsets.only(bottom: profileheight / 2),
          child: buildCoverImage(),
        ),
        Positioned(
          top: coverheight - profileheight / 2,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          Text('Ardi Ferdinan',
              style: blackTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 28,
              )),
          Text(
            'Amateur Software Engineer',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialicon(
                  FontAwesomeIcons.facebook,
                  () => setState(() {
                        _launched = _launchInWebViewOrVC(toLaunch);
                      })),
              const SizedBox(
                width: 12.5,
              ),
              buildSocialicon(
                  FontAwesomeIcons.instagram,
                  () => setState(() {
                        _launched = _launchInWebViewOrVC(toLaunch1);
                      })),
              const SizedBox(
                width: 12.5,
              ),
              buildSocialicon(
                  FontAwesomeIcons.github,
                  () => setState(() {
                        _launched = _launchInWebViewOrVC(toLaunch2);
                      })),
              const SizedBox(
                width: 12.5,
              ),
              buildSocialicon(
                  FontAwesomeIcons.twitter,
                  () => setState(() {
                        _launched = _launchInWebViewOrVC(toLaunch3);
                      })),
              const SizedBox(
                width: 12.5,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: blackTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'I am a final year student at the Buddhi Dharma University, ' +
                      'which is making an Android-based expert system application for ' +
                      'the purposes of my thesis, thank you for the help and support.',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildCoverImage() => Container(
        color: kGreyColor,
        child: Image.network(
          'https://wallpapercave.com/wp/wp9303780.jpg',
          width: double.infinity,
          height: coverheight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileheight / 2,
        backgroundColor: kGreyColor,
        child: CircleAvatar(
          radius: profileheight / 2.11,
          backgroundColor: kGreyColor,
          backgroundImage: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/sistempakarpajak.appspot.com/o/assets%2F181000052.jpeg?alt=media&token=e2bbb9f1-4d82-48a7-9794-be32a1cad0e7',
          ),
        ),
      );

  Widget buildSocialicon(IconData icon, Function() ontap) => CircleAvatar(
      radius: 28,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: kGreyColor,
        child: InkWell(
          onTap: ontap,
          child: Center(
              child: Icon(
            icon,
            size: 32,
          )),
        ),
      ));
}
