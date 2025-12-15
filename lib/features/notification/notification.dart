import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/notification/Notification_item.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/chat.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
      color: AppColors.white,
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
                          'assets/icons/arrow_left_black.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Thông báo',
                        style: GlobalStyles.mediumTitle.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Divider(thickness: 2, color: AppColors.border),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemCount: chats.length,
                              itemBuilder: (context, index) {
                                return NotificationItem(notiItem: chats[index]);
                              },
                            ),
                          ],
                        ),
                      ),
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
