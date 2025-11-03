import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class EarningApp extends StatelessWidget {
  const EarningApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light();
    final dark = AppTheme.dark();
    return MaterialApp.router(
      title: 'Earning App',
      theme: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
        useMaterial3: true,
      ),
      darkTheme: dark.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(dark.textTheme),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
