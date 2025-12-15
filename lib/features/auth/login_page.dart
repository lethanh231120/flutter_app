import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import 'login_styles.dart';
import '../../widgets/AppButton.dart';
import 'register_page.dart';
import '../../helper/animation.dart';

// import 'package:my_app/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 30),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                'Đăng nhập',
                style: GlobalStyles.titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              TextField(
                style: TextStyle(fontSize: AppText.font16),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 6),
                  hintText: 'Số điện thoại',
                  hintStyle: GlobalStyles.hintText.copyWith(
                    fontSize: AppText.font16,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ), // màu khi focus
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 35),
              TextField(
                style: TextStyle(fontSize: AppText.font16),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 6),
                  hintText: 'Mật khẩu',
                  hintStyle: GlobalStyles.hintText.copyWith(
                    fontSize: AppText.font16,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              Text(
                'Quên mật khẩu',
                style: LoginStyles.textUnderline,
                textAlign: TextAlign.end,
              ),
              const SizedBox(height: 20),
              AppButton(
                label: "Đăng nhập",
                // icon: Icons.login,
                type: ButtonType.primary,
                // loading: true,
                onPressed: () {
                  // xử lý click
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.border, thickness: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Hoặc đăng nhập với',
                      style: LoginStyles.subTitle,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.border, thickness: 2),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/google.png',
                      width: 45,
                      height: 45,
                      color: null, // quan trọng: cho phép tint
                    ),

                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/facebook.png',
                      width: 48,
                      height: 48,
                      color: null, // quan trọng: cho phép tint
                    ),

                    onPressed: () {},
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chưa có tài khoản?', style: LoginStyles.textStyle),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      navigateToPage(context, const RegisterPage());
                    },
                    child: Text('Đăng ký', style: LoginStyles.textUnderline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
