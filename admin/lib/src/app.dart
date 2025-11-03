import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'router.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(colorSchemeSeed: const Color(0xFF6C63FF), useMaterial3: true);
    return MaterialApp.router(
      title: 'Admin Panel',
      theme: base.copyWith(textTheme: GoogleFonts.interTextTheme(base.textTheme)),
      routerConfig: router,
    );
  }
}
