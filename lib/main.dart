import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/main_screen.dart';
import 'package:my_app/route/app_route.dart';
import '../core/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'main_layout.dart';
// import 'route/app_route.dart';

final logger = Logger();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.lightTheme,
    //   home: FutureBuilder<bool>(
    //     future: AuthService.isLoggedIn(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Material(
    //           // ← DÒNG DUY NHẤT CẦN THAY
    //           color: Colors.white,
    //           child: Center(child: CircularProgressIndicator()),
    //         );
    //       }

    //       final isLoggedIn = snapshot.data ?? false;

    //       return isLoggedIn
    //           ? const MainLayout(initialIndex: 0)
    //           : const MainScreen();
    //     },
    //   ),
    // );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: goRouter, // ← CHỈ 1 DÒNG NÀY LÀ XONG!
    );
  }
}
