import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles.dart';

Widget listButton(String? pathIcon, String text, Function onTap) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration:
            BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            pathIcon != null
                ? Row(
                    children: [
                      SizedBox(height: 25, child: Image.asset(pathIcon)),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                : SizedBox(),
            Text(
              text,
              style: GoogleFonts.poppins(fontSize: 12, color: white),
            )
          ],
        ),
      ),
    ),
  );
}
