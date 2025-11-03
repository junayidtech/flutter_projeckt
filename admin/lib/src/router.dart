import 'package:go_router/go_router.dart';
import 'pages/dashboard_page.dart';
import 'pages/users_page.dart';
import 'pages/withdraw_page.dart';
import 'pages/tasks_page.dart';
import 'pages/ads_page.dart';
import 'pages/referrals_page.dart';
import 'pages/content_page.dart';
import 'pages/audit_page.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const DashboardPage()),
  GoRoute(path: '/users', builder: (_, __) => const UsersPage()),
  GoRoute(path: '/withdraws', builder: (_, __) => const WithdrawPage()),
  GoRoute(path: '/tasks', builder: (_, __) => const TasksPage()),
  GoRoute(path: '/ads', builder: (_, __) => const AdsPage()),
  GoRoute(path: '/referrals', builder: (_, __) => const ReferralsPage()),
  GoRoute(path: '/content', builder: (_, __) => const ContentPage()),
  GoRoute(path: '/audit', builder: (_, __) => const AuditPage()),
]);
