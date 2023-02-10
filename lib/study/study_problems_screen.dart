// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tang_clue/constants/gaps.dart';
import 'package:tang_clue/constants/sizes.dart';
import 'package:tang_clue/widgets/drawing_board_x1.dart';

class StudyProblemsScreen extends StatefulWidget {
  const StudyProblemsScreen({Key? key}) : super(key: key);

  @override
  State<StudyProblemsScreen> createState() => _StudyProblemsScreenState();
}

class _StudyProblemsScreenState extends State<StudyProblemsScreen> {
  int _hintStep = 0;
  final TextEditingController _ansController = TextEditingController();
  String _ans = "";

  void _onTapTang() {
    setState(() {
      if (_hintStep > 1) return;
      _hintStep++;
    });
  }

  void _onSubmit() {
    print(_ans);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ansController.addListener(() {
      setState(() {
        _ans = _ansController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("2022년 3월 모의고사"), actions: [
        Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size4, horizontal: Sizes.size32),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Sizes.size12),
                  border: Border.all(color: Colors.red, width: Sizes.size3)),
              // width: 120,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.size10),
                child: Center(
                  child: GestureDetector(
                    onTap: _onTapTang,
                    child: (Text(
                      "Tang! ($_hintStep/2)",
                      style: const TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
            ))
      ]),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10, vertical: Sizes.size40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: const Image(
                        image: NetworkImage(
                            "https://lh3.googleusercontent.com/928ES-FiqtRqgaJArJdCe4lwTOETkdI-1uRGU8-TwRhUB2ppppDPgHKfE66Zt7IdgzRpg4c3mAsY3WbtG6NeCAslXuH5CThomLcU3HIY9-YPFLuHGkKdZIw27B6KJn7np4L0PvoynRNPMv5swxe1D7Dc3toPEQ")),
                  ),
                  Gaps.v48,
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _hintStep > 0 ? 1 : 0,
                    child: Container(
                      child: const Image(
                          image: NetworkImage(
                              "https://lh4.googleusercontent.com/g5-aNPSnUGlh0uEqilgRGRBSNY60h3dmIUSBo0WcXiWltGFZb8ex0HF60l3TmdBlMb24OExsEysTuosx-AiEeFoIVo_7gcNket40vshqAyFDtrcZsNKOkUmnGGI_tlFK1Rax6ZrCGjWnqHyvCGmu1V42Av8oBw")),
                    ),
                  ),
                  Gaps.v48,
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _hintStep > 1 ? 1 : 0,
                      child: Container(
                        child: const Image(
                            image: NetworkImage(
                                "https://lh4.googleusercontent.com/5TR-gxpzYFwwCQuUH7F7BEU_l3OUAUKMXhz4UW6uJ8kmY8KqvXKtEa5LFTn2U2_OfbEVpGk41GUyyKR0-f-J135Rj5h3u14lDW60aufW5DoXPgUZ8163BVi9tVUCrszqqHHUJ34llQAm18z_bG0BghbEtB2trg")),
                      )),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.all(Sizes.size20),
                child: Column(
                  children: [
                    const FractionallySizedBox(
                      widthFactor: 1,
                    ),
                    Expanded(
                      child: DrawingBoardX1(
                        background: Container(
                          color: Colors.white,
                          width: 20000,
                          height: 20000,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: TextField(
                            onEditingComplete: _onSubmit,
                            controller: _ansController,
                            decoration:
                                const InputDecoration(hintText: "정답을 입력하세요."),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: CupertinoButton(
                              onPressed: _onSubmit,
                              child: const Text("Submit"),
                            )),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
