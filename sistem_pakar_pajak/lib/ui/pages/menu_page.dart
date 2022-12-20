import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/cubit/auth_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/page_cubit.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/pages/about_company.dart';
import 'package:sistem_pakar_pajak/ui/pages/about_me.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_menu_body.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthState userState = context.read<AuthCubit>().state;

    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: kWhiteColor,
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 24,
          ),
          child: Text(
            'Profile',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          color: kWhiteColor,
          width: double.infinity,
          height: 70,
          padding: EdgeInsets.only(
            bottom: 10,
          ),
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: defaultmargin,
                  right: defaultmargin,
                ),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kGreyColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Icon(Icons.person),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(
                  top: 7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width - 48,
                      child: Text(
                        (userState is AuthSuccess) ? userState.user.name : "",
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                        (userState is AuthSuccess) ? userState.user.email : ""),
                  ],
                ),
              ))
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: kWhiteColor,
          padding: const EdgeInsets.only(
            left: 24,
            top: 15,
            bottom: 15,
          ),
          child: Text(
            'Keamanan',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
        ),
        GestureDetector(
          onTap: (() {
            Navigator.pushNamed(
              context,
              '/reset',
            );
          }),
          child: CustomMenuBody(
            title: 'Ubah Password',
            icon: Icons.lock,
          ),
        ),
        Container(
          width: double.infinity,
          color: kWhiteColor,
          margin: EdgeInsets.only(
            top: 10,
          ),
          padding: const EdgeInsets.only(
            left: 24,
            top: 24,
            bottom: 15,
          ),
          child: Text(
            'Tentang',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutCompany()),
            );
          },
          child: CustomMenuBody(
            title: 'Tentang Perusahaan',
            icon: Icons.local_library,
          ),
        ),
        GestureDetector(
          onTap: () => showAboutDialog(
            context: context,
            applicationIcon: SizedBox(
                width: 48, height: 48, child: Image.asset("assets/logo.png")),
            applicationVersion: '1.0.0',
            applicationName: 'TAX Pakar',
            applicationLegalese: 'Ardi Ferdinan',
          ),
          child: CustomMenuBody(
            title: 'Tentang Aplikasi',
            icon: Icons.widgets,
          ),
        ),
        GestureDetector(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutMe()),
            );
          }),
          child: CustomMenuBody(
            title: 'Tentang Pengembang',
            icon: Icons.person,
          ),
        ),
        Spacer(),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(
                    state.error,
                  ),
                ),
              );
            } else if (state is AuthInitial) {
              context.read<PageCubit>().setpage(0);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: CustomButton(
                title: 'Log Out',
                colorbtn: kPrimaryColor,
                textcolor: kWhiteColor,
                width: 250,
                onpressed: () {
                  context.read<AuthCubit>().signout();
                },
              ),
            );
          },
        ),
        SizedBox(
          height: 120,
        ),
      ],
    );
  }
}
