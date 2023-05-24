import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles.dart';

Widget listButton(String? pathIcon, String text, Function onTap) {
  return GestureDetector(
    onTap: () => onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 230,
      height: 50,
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pathIcon != null
              ? Row(
                  children: [
                    SizedBox(height: 25, child: Image.asset(pathIcon)),
                    SizedBox(
                      width: 5,
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
  );
}
