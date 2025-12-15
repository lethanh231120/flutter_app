import 'package:flutter/material.dart';
import 'package:my_app/global_styles.dart';
import 'login_styles.dart';
import '../../core/constants/colors.dart';
import '../../widgets/AppButton.dart';
import 'login_page.dart';
import '../../helper/animation.dart';
import '../../widgets/AppInput.dart';
import 'verify_otp.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controller khi màn hình bị hủy
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text;

    print('Name: $name');
    print('Phone: $phone');
    print('Password: $password');

    // navigateToPage(context, VerifyOtpPage());
    context.push('/verify-otp');
    // TODO: Xử lý đăng ký
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 30),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                'Tạo tài khoản',
                style: GlobalStyles.titleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              AppInput(
                placeholder: 'Họ tên',
                controller: nameController,
                height: 50,
              ),
              SizedBox(height: 14),
              AppInput(
                placeholder: 'Số điện thoại',
                keyboardType: TextInputType.phone,
                controller: phoneController,
                height: 50,
              ),
              SizedBox(height: 14),
              AppInput(
                placeholder: 'Nhập mật khẩu',
                obscureText: true,
                controller: passwordController,
                height: 50,
              ),
              SizedBox(height: 14),
              AppButton(
                label: "Đăng Ký",
                // icon: Icons.login,
                type: ButtonType.primary,
                // loading: true,
                onPressed: () {
                  _submit();
                  // navigateToPage(context, VerifyOtpPage());
                  // xử lý click
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.border, thickness: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Hoặc đăng ký với',
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
                  Text('Đã có tài khoản?', style: LoginStyles.textStyle),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      navigateToPage(context, const LoginPage());
                    },
                    child: Text('Đăng nhập', style: LoginStyles.textUnderline),
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
