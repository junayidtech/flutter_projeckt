import 'package:flutter/material.dart';

const primaryColor = Color(0xFF6C63FF);
const accentA = Color(0xFF6C63FF);
const accentB = Color(0xFF00C9A7);

LinearGradient appGradient() => const LinearGradient(
  colors: [accentA, accentB],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

BoxDecoration glass({double blur = 12, Color tint = Colors.white24}) {
  return BoxDecoration(
    color: tint,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 20,
        offset: const Offset(0, 8),
      )
    ],
  );
}

ThemeData _base(Brightness b) => ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: b,
);

class AppTheme {
  static ThemeData light() => _base(Brightness.light);
  static ThemeData dark() => _base(Brightness.dark);
}
