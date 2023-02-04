import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.6,
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
              'Never run out of medicine, find nearby availability with one tap.',
              textAlign: TextAlign.center,
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
          Container(
            width: size.width * 0.8,
            height: size.height * 0.07,
            decoration: const BoxDecoration(
              color: Color(0xff8871E6),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Gilroy',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: size.width * 0.8,
            height: size.height * 0.07,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff8871E6), width: 3),
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
    );
  }
}

// Text(
//             'MediBuddy',
//             style: TextStyle(
//               color: Color(0xff8871E6),
//               fontSize: 50,
//               fontFamily: 'Gilroy',
//               fontWeight: FontWeight.w100,
//             ),
//           ),