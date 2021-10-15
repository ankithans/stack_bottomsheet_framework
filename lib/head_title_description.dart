import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/size_helpers.dart';

class HeadTitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const HeadTitleDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) * 0.13,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff929ea5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    description,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff4a555e),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: displayWidth(context) * 0.08),
          ],
        ),
      ),
    );
  }
}
