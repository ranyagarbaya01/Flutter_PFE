import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  void Function()? onPressed;
  final String title;
  Widget? widget;

  RoundedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 22, 219, 101)),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            widget != null ? SizedBox(width: 10) : SizedBox(),
            widget ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
