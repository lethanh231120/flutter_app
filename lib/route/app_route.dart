// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/features/auth/register_page.dart';
import 'package:my_app/features/auth/verify_otp.dart';
import 'package:my_app/features/book_ticket/book_ticket.dart';
import 'package:my_app/features/chat/chat_detail.dart';
import 'package:my_app/features/detail_trip/detail_trip_driver.dart';
import 'package:my_app/features/driver_info/driver_info.dart';
import 'package:my_app/features/home/home_page_drive.dart';
import 'package:my_app/features/notification/notification.dart';
import 'package:my_app/features/register-route/register_route.dart';
import 'package:my_app/main_layout.dart';
import 'package:my_app/main_screen.dart';
import '../features/home/home_page.dart';
// import 'package:my_app/features/detail/pages/detail_trip_page.dart';
import '../features/detail_trip/detail_trip.dart';
import 'package:my_app/models/trip.dart';
import '../features/chat/chat.dart';
import '../features/profile/profile.dart';
import '../features/trip_route/trip_route.dart';
import '../features/notification/notification.dart';

const List<String> exceptionRoutes = [
  '/trip/',
  '/trip_drive/',
  '/book-ticket',
  '/home',
  '/chat',
  '/chat-detail',
  '/profile',
  '/trips',
  '/notification',
  '/drive-info',
  '/register_route',
];
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      ),
    ),
    GoRoute(
      path: '/register',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/verify-otp',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const VerifyOtpPage(),
    ),
    GoRoute(
      path: '/main-screen',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const MainScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/trip/:tripId',
          builder: (context, state) {
            final id = state.pathParameters['tripId']!;
            return DetailTripPage(tripId: id);
          },
        ),
        GoRoute(
          path: '/trip_drive/:tripId',
          builder: (context, state) {
            final id = state.pathParameters['tripId']!;
            return DetailTripDrivePage(tripId: id);
          },
        ),
        GoRoute(
          path: '/book-ticket',
          builder: (context, state) {
            final trip = state.extra as Trip;
            return BookTicket(trip: trip);
          },
        ),
        GoRoute(
          path: '/book-ticket',
          builder: (context, state) {
            final trip = state.extra as Trip;
            return BookTicket(trip: trip);
          },
        ),
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(
          path: '/home_drive',
          builder: (context, state) => HomePageDrive(),
        ),
        GoRoute(path: '/trips', builder: (context, state) => TripRoute()),
        GoRoute(path: '/chat', builder: (context, state) => ChatPage()),
        GoRoute(
          path: '/register_route',
          builder: (context, state) => RegisterRoute(),
        ),
        GoRoute(
          path: '/notification',
          builder: (context, state) => NotificationPage(),
        ),
        GoRoute(
          path: '/chat-detail',
          builder: (context, state) {
            final data = state.extra as Map;
            final ownerId = data['ownerId']!;
            final customerId = data['customerId']!;
            return ChatDetailPage(ownerId: ownerId, customerId: customerId);
          },
        ),
        GoRoute(
          path: '/drive-info/:driveId',
          builder: (context, state) {
            final driveId = state.pathParameters['driveId']!;
            return DriveInfoPage(driveId: driveId);
          },
        ),
        GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
      ],
    ),
  ],
  redirect: (context, state) async {
    final loggedIn = await AuthService.isLoggedIn();
    final path = state.matchedLocation;
    final publicRoutes = ['/main-screen', '/register', '/verify-otp'];
    final isSplash = state.uri.path == '/splash';

    if (state.extra is Map && (state.extra as Map).containsKey('bypassLogin')) {
      return null;
    }
    if (isSplash) {
      return loggedIn ? '/home' : '/main-screen';
    }

    final isAuthFlow = [
      '/main-screen',
      '/register',
      '/verify-otp',
      '/trip',
      '/trip_drive',
      '/book-ticket',
      '/register_route',
    ].contains(state.matchedLocation);

    final isException = exceptionRoutes.any((r) => path.startsWith(r));
    if (!loggedIn) {
      if (!publicRoutes.contains(path) && !isException) {
        return '/main-screen';
      }
      return null;
    }
    if (loggedIn && isAuthFlow) {
      return '/home';
    }
    return null;
  },
);
