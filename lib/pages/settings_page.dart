import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_cycle_app/pages/show_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: Color(0xFFFE764B),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Color(0xFFFE764B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Color(0xFFE4E4E4),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                border: Border.all(color: const Color(0xFFECECEC), width: 1),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/share.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Share with friends',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.black.withOpacity(0.4),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ReadTermsOrPrivacyScreenView(
                          link: 'google.com',
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  border: Border.all(color: const Color(0xFFECECEC), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/terms.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Terms of Use',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black.withOpacity(0.4),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ReadTermsOrPrivacyScreenView(
                          link: 'google.com',
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  border: Border.all(color: const Color(0xFFECECEC), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/privacy.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black.withOpacity(0.4),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                border: Border.all(color: const Color(0xFFECECEC), width: 1),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/rate.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Rate app',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.black.withOpacity(0.4),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
