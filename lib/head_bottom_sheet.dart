import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/size_helpers.dart';

class HeadBottomSheet extends StatefulWidget {
  final String title;
  final String description;

  const HeadBottomSheet({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _HeadBottomSheetState createState() => _HeadBottomSheetState();
}

class _HeadBottomSheetState extends State<HeadBottomSheet> {
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
                  widget.title,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff4a555e),
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    widget.description,
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff929ea5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: displayWidth(context) * 0.08),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[100],
            ),
            SizedBox(width: displayWidth(context) * 0.08),
          ],
        ),
      ),
    );
  }
}
