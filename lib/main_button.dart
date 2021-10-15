import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  const MainButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.zero,
        minimumSize: const Size(50, 65),
        backgroundColor: const Color(0xff3d4ca3),
      ),
      child: Text(
        widget.title,
        style: GoogleFonts.montserrat(
          color: const Color(0xffebded9),
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () => widget.onPressed(),
    );
  }
}
