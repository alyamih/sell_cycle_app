import 'package:flutter/material.dart';
import 'package:sell_cycle_app/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 65, 16, 32),
                  child: Image.asset('assets/onBoarding.png'),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'An easy way to get rid of excess.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 117),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add unwanted items for sale!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 32),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomePage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: const Color(0xFFFE764B),
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'Get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Terms of Use / Privacy Policy',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
