import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/chat/ChatUser.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/chat.dart';
import 'package:my_app/widgets/AppInput.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatOverview> chats = [
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: true,
      time: '10:30',
      status: 1,
      message: 'Hello tôi có thể đặt vé không',
    ),
    ChatOverview(
      id: 1,
      userId: 2,
      userAvatar: 'assets/icons/user_large.png',
      userName: 'Nam Trang',
      userPhone: '098765432',
      userActive: false,
      time: '10:30',
      status: 0,
      message: 'Hello tôi có thể đặt vé không',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/icons/arrow_left_white.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Tin nhắn',
                        style: GlobalStyles.mediumTitle.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppInput(
                          backgroundColor: AppColors.border,
                          border: false,
                          borderRadius: 25,
                          height: 50,
                          placeholder: 'Search',
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: chats.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: ChatUser(chatItem: chats[index]),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
