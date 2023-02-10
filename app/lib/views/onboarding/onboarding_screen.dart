import 'package:flutter/material.dart';
import 'package:medibuddy/views/onboarding/rounded_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            Container(
              margin: const EdgeInsets.all(2),
              height: size.height * 0.4,
              child: Image.asset(
                "assets/images/doc3.jpeg",
                fit: BoxFit.fill,
              ),
            ),
            Center(
                child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Medi",
                    style: TextStyle(
                      color: Color(0xff8871E6),
                      fontSize: 50,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: "Buddy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Never run out of medicine,\n find nearby availability with one tap.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontFamily: 'Gilroy',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(size: size,title:'LOGIN'),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: size.width * 0.75,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff8871E6), width: 2),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xff8871E6),
                    fontSize: 20,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


