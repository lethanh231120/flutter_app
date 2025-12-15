import 'package:flutter/material.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/features/home/home_page.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/helper/animation.dart';
import 'package:my_app/main_layout.dart';
import '../../widgets/AppInput.dart';
import 'package:flutter/services.dart';
import '../../widgets/AppButton.dart';
import 'login_styles.dart';
import 'package:go_router/go_router.dart';
import '../../route/app_route.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  // final TextEditingController emailController = TextEditingController();
  final int otpLength = 6;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                'Xác thực OTP',
                style: GlobalStyles.titleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: Text(
                  'Mã xác thực đã được gửi đến số điện thoại của bạn. Vui lòng nhập mã để tiếp tục.',
                  style: GlobalStyles.regularText.copyWith(
                    fontWeight: AppText.medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(otpLength, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: AppInput(
                        width: 45,
                        height: 45,
                        type: 'square',
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // chỉ số
                          LengthLimitingTextInputFormatter(1), // chỉ 1 ký tự
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty && index < otpLength - 1) {
                            FocusScope.of(
                              context,
                            ).requestFocus(focusNodes[index + 1]);
                          }
                          if (value.isEmpty && index > 0) {
                            FocusScope.of(
                              context,
                            ).requestFocus(focusNodes[index - 1]);
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              AppButton(
                label: "Xác nhận",
                type: ButtonType.primary,
                onPressed: () async {
                  // navigateToPage(context, const HomePage());
                  // bool success = await verifyOtp(); // hàm của bạn

                  // if (context.mounted) {
                  // if (success && context.mounted) {
                  // Đẩy về MainLayout + chọn tab Trang chủ
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: (context) => const MainLayout(),
                  //   ),
                  //   (route) => false, // xóa hết stack cũ → sạch sẽ
                  // );
                  // }
                  print('verify');
                  // context.go('/home');
                  GoRouter.of(
                    context,
                  ).go('/home', extra: {'bypassLogin': true});
                  // GoRouter.of(context).go('/home');
                  // rootNavigatorKey.currentState!.context!.go('/home');
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chưa nhận được mã?', style: LoginStyles.textStyle),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // navigateToPage(context, const LoginPage());
                    },
                    child: Text('Gửi lại mã', style: LoginStyles.textUnderline),
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
