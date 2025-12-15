import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/features/auth/login_page.dart';
import 'helper/animation.dart';
import 'features/auth/register_page.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            color: AppColors.mediumBlack,
          ),
          Center(
            child: Container(
              width: size.width * 0.85,
              height: size.height * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: BoxDecoration(
                color: AppColors.semiBlack,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 240,
                    height: 240,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: size.width * 0.85,
              height: size.height * 0.8,
              padding: const EdgeInsets.fromLTRB(15, 210, 15, 15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Đặt dễ dàng, đi thoải mái",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// BUTTON 1
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: "Đăng ký",
                      onPressed: () {
                        // navigateToPage(context, const RegisterPage());
                        context.push('/register');
                      },
                      // type: ButtonType.fill,
                      // bgColor: Colors.blueAccent,
                      // foregroundColor: Colors.white,
                      // padding: const EdgeInsets.symmetric(vertical: 14),
                      // borderRadius: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: "Đăng nhập",
                      onPressed: () {
                        navigateToPage(context, const LoginPage());
                      },
                      // type: ButtonType.fill,
                      // bgColor: Colors.blueAccent,
                      // foregroundColor: Colors.white,
                      // padding: const EdgeInsets.symmetric(vertical: 14),
                      // borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
