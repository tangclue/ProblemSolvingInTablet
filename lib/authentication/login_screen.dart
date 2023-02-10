import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tang_clue/constants/sizes.dart';
import 'package:tang_clue/study/select_problems_screen.dart';

import '../constants/gaps.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void _onTabNext(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SelectProblemsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Sizes.size80 + Sizes.size80),
              child: Column(
                children: [
                  const Text(
                    "수학이 재미있다. Tang Clue",
                    style: TextStyle(
                        fontSize: Sizes.size36, fontWeight: FontWeight.w700),
                  ),
                  Gaps.v60,
                  Text(
                    "힌트와 함께하는 재밌는 수학",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size80 + Sizes.size80),
                child: FractionallySizedBox(
                  // heightFactor: 0.3,
                  child: Image.asset('assets/image1.png'),
                ),
              ),
            ),
            Align(
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: Sizes.size80 + Sizes.size80),
                child: CupertinoButton(
                  onPressed: () {
                    _onTabNext(context);
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    "계속하기",
                    style: TextStyle(
                        fontSize: Sizes.size36, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   height: Sizes.size80 + Sizes.size80 + Sizes.size80,
      //   child: CupertinoButton(
      //     onPressed: () {},
      //     color: Theme.of(context).primaryColor,
      //     child: const Text(
      //       "계속하기",
      //       style:
      //           TextStyle(fontSize: Sizes.size36, fontWeight: FontWeight.w600),
      //     ),
      //   ),
      // ),
    );
  }
}
