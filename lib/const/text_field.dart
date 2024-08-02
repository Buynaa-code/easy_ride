import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final textFieldStyle = GoogleFonts.poppins(
  color: text100,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final textFieldDisabledStyle = GoogleFonts.poppins(
  color: text100.withOpacity(0.8),
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final textFieldHintStyle = GoogleFonts.poppins(
  color: greyColor4,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final textFieldDisabledHintStyle = GoogleFonts.poppins(
  color: greyColor3,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

TextStyle get ktsTitleText => GoogleFonts.montserrat(
      fontSize: 26,
      height: 0.95,
      fontWeight: FontWeight.w800,
    );

TextStyle get ktsBodySmall => GoogleFonts.montserrat(
      fontSize: 12,
    );

TextStyle get ktsBodySmallBold => GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w800,
    );

TextStyle get ktsBodyRegular => GoogleFonts.montserrat(
      fontSize: 14,
    );
TextStyle get ktsBodyMedium => GoogleFonts.montserrat(
      fontSize: 16,
    );
TextStyle get ktsBodyMediumBold => GoogleFonts.montserrat(
      fontSize: 16,
    );

TextStyle get ktsBodyRegularBold => GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w800,
    );

TextStyle get ktsBodyLarge => GoogleFonts.montserrat(
      fontSize: 18,
    );

TextStyle get ktsBodyLargeBold => GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

TextStyle get ktsBodyMassive => GoogleFonts.montserrat(
      fontSize: 22,
    );

TextStyle get ktsBodyMassiveBold => GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );

TextStyle get ktsBodyMassivePlus => GoogleFonts.montserrat(
      fontSize: 32,
    );

TextStyle get ktsBodyMassivePlusBold => GoogleFonts.montserrat(
      fontSize: 32,
      fontWeight: FontWeight.w800,
    );
