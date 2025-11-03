import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/view/login_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/wallet/view/wallet_screen.dart';
import '../../features/withdraw/view/withdraw_screen.dart';
import '../../features/referral/view/referral_screen.dart';
import '../../features/profile/view/profile_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/wallet', builder: (_, __) => const WalletScreen()),
    GoRoute(path: '/withdraw', builder: (_, __) => const WithdrawScreen()),
    GoRoute(path: '/referral', builder: (_, __) => const ReferralScreen()),
    GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
  ],
);
