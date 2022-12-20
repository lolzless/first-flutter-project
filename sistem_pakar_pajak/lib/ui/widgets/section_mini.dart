import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/pages/daftar_klien.dart';
import 'package:sistem_pakar_pajak/ui/pages/solution_page.dart';

class sectionmini extends StatelessWidget {
  const sectionmini({
    Key? key,
    required this.framesize,
  }) : super(key: key);

  final double framesize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * framesize - 10,
      height: 100,
      margin: EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chatpakar');
                },
                child: Container(
                  width: 170,
                  height: 80,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: kGreyColor,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 5,
                          offset: Offset(-5, 0),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 5,
                          offset: Offset(5, 0),
                        ),
                      ]),
                  child: Image.asset('assets/image_card_mini_1.png'),
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailSender(),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 80,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: kGreyColor,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(5, 0),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/image_card_mini_2.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
