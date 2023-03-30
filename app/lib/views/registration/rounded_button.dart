import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.size, required this.title,required this.onTap})
      : super(key: key);

  final Size size;
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onTap();
      },
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.07,
        decoration: const BoxDecoration(
          color: Color(0xff8871E6),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'GilroyBold',
            ),
          ),
        ),
      ),
    );
  }
}
