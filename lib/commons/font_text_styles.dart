import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practices/commons/color.dart';

final TextStyle titleMedium = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: colorBlack
);

final TextStyle titleLarge = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: colorBlack
);

final TextStyle titleSmall = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: colorBlack
);

final TextStyle bodyRegular = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: colorBlack
);

final TextStyle bodyLarge = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

final TextStyle labelRegular = GoogleFonts.poppins(
  fontSize: 10,
  fontWeight: FontWeight.w500,
  color: colorGrey
);

final customTextTheme = TextTheme(
  titleLarge: titleLarge,
  titleMedium: titleMedium,
  titleSmall: titleSmall,
  bodyLarge: bodyLarge,
  bodyMedium: bodyRegular,
  labelMedium: labelRegular
);

