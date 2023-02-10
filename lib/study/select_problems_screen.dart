import 'package:flutter/material.dart';
import 'package:tang_clue/constants/gaps.dart';
import 'package:tang_clue/constants/sizes.dart';
import 'package:tang_clue/study/study_problems_screen.dart';

class SelectProblemsScreen extends StatelessWidget {
  const SelectProblemsScreen({Key? key}) : super(key: key);

  void _onTapProbplem(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const StudyProblemsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("문제 List"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size36),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "#1 모의고사",
              style: TextStyle(
                  fontSize: Sizes.size36, fontWeight: FontWeight.w600),
            ),
            Gaps.v40,
            GestureDetector(
              onTap: () {
                _onTapProbplem(context);
              },
              child: Container(
                width: Sizes.size96 * 3,
                height: Sizes.size96 * 3,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(Sizes.size48),
                    border: Border.all(
                        color: Colors.grey.shade500, width: Sizes.size3)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.size48),
                  child: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "2022년",
                            style: TextStyle(fontSize: Sizes.size32),
                          ),
                          Gaps.v10,
                          const Text(
                            "3월 모의고사",
                            style: TextStyle(fontSize: Sizes.size40),
                          ),
                          Gaps.v10,
                          Text(
                            "30 문제",
                            style: TextStyle(
                                fontSize: Sizes.size28,
                                color: Colors.grey.shade700),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Gaps.v40,
            const Text(
              "#2 수능기출",
              style: TextStyle(
                  fontSize: Sizes.size36, fontWeight: FontWeight.w600),
            ),
            Gaps.v40,
            Container(
              width: Sizes.size96 * 3,
              height: Sizes.size96 * 3,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.size48),
                  border: Border.all(
                      color: Colors.grey.shade500, width: Sizes.size3)),
              child: const Center(
                child: Text(
                  "준비중입니다.",
                  style: TextStyle(fontSize: Sizes.size36),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
