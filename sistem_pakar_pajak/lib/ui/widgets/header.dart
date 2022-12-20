import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_pakar_pajak/cubit/auth_cubit.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(bottom: 5),
            height: size.height * 0.15,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: defaultmargin,
                    right: defaultmargin,
                  ),
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [kSecondaryColor, kPrimaryColor],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width - 48,
                              child: Text(
                                'Halo, ${state.user.name}',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: size.width * 0.88,
                              child: Text(
                                'Ayo mulai berkonsultasi dengan TAX consultant' +
                                    ' mudahkan perpajakanmu dengan pakar kami',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: light,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
