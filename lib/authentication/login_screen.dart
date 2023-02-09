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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size80 + Sizes.size80),
                child: FractionallySizedBox(
                  // heightFactor: 0.3,
                  child: Image(
                    image: NetworkImage(
                        "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/62b82ea1-36c1-4adb-b413-da0b9a32525f/BI_TangClue_instagram.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230208%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230208T010305Z&X-Amz-Expires=86400&X-Amz-Signature=24c831f39e656dc8f09cc898a63ef717de7d1b00889a11bdf0e0897d39b11daf&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22BI_TangClue_instagram.png%22&x-id=GetObject"),
                    // height: Sizes.size48,
                    // fit: BoxFit.cover,
                  ),
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
