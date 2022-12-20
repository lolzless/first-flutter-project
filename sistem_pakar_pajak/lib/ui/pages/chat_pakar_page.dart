import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:sistem_pakar_pajak/cubit/auth_cubit.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class ChatPakar extends StatelessWidget {
  const ChatPakar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return MaterialApp(
            home: SafeArea(
              child: Scaffold(
                // appBar: AppBar(
                //   title: const Text('Flutter Tawk'),
                //   backgroundColor: const Color(0XFFF7931E),
                //   elevation: 0,
                // ),
                body: Tawk(
                  directChatLink:
                      'https://tawk.to/chat/62b693247b967b1179966be1/1g6citi9f',
                  visitor: TawkVisitor(
                    name: '${state.user.name}',
                    email: '${state.user.email}',
                  ),
                  onLoad: () {
                    print('Hello Tawk!');
                  },
                  onLinkTap: (String url) {
                    print(url);
                  },
                  placeholder: const Center(
                    child: Text('Loading...'),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
