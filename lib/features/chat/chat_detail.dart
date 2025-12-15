import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/chat/ChatUser.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/chat.dart';
import 'package:my_app/models/customer.dart';
import 'package:my_app/models/message.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/models/message.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppTextArea.dart';
import 'package:my_app/widgets/car_info.dart';
import 'package:go_router/go_router.dart';

class ChatDetailPage extends StatefulWidget {
  final int customerId;
  final int ownerId;
  const ChatDetailPage({
    Key? key,
    required this.customerId,
    required this.ownerId,
  }) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final ChatDetail chatDetail = ChatDetail(
    id: 1,
    userPair: [
      Customer(
        id: 1,
        avatar: 'assets/icons/user_large.png',
        phone: '098765432',
        name: 'Nam Trang',
        active: true,
      ),
      Customer(
        id: 2,
        avatar: 'assets/icons/user_large.png',
        phone: '098765432',
        name: 'Nam Trang',
        active: true,
      ),
    ],
    messages: [
      Message(
        time: '10:30 25/4/2025',
        content: [
          'Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không',
          'Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không',
        ],
        userId: 1,
        id: 1,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: [
          'Hello tôi có thể đặt vé không, Hello tôi có thể đặt vé không.',
          'Hello tôi có thể đặt vé không',
        ],
        userId: 2,
        id: 2,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: ['Hello tôi có thể đặt vé không'],
        userId: 1,
        id: 1,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: [
          'Hello tôi có thể đặt vé không, Hello tôi có thể đặt vé không.',
          'Hello tôi có thể đặt vé không',
          'Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không',
        ],
        userId: 2,
        id: 2,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: ['Hello tôi có thể đặt vé không'],
        userId: 1,
        id: 1,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: [
          'Hello tôi có thể đặt vé không, Hello tôi có thể đặt vé không.',
          'Hello tôi có thể đặt vé không',
        ],
        userId: 2,
        id: 2,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: [
          'Hello tôi có thể đặt vé không',
          'Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không',
        ],
        userId: 1,
        id: 1,
        avatar: 'assets/icons/user_large.png',
      ),
      Message(
        time: '10:30 25/4/2025',
        content: [
          'Hello tôi có thể đặt vé không, Hello tôi có thể đặt vé không.',
          'Hello tôi có thể đặt vé không',
          'Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không. Hello tôi có thể đặt vé không',
        ],
        userId: 2,
        id: 2,
        avatar: 'assets/icons/user_large.png',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/icons/arrow_left_white.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/icons/user_large.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '098765432',
                                  style: GlobalStyles.textBold14.copyWith(
                                    color: AppColors.white,
                                  ),
                                  softWrap: true,
                                ),
                                SizedBox(width: 8),
                              ],
                            ),

                            Text(
                              'Đanh hoạt động',
                              style: GlobalStyles.textBold12.copyWith(
                                color: AppColors.grey,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: AppColors.grey,
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 70),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...chatDetail.messages.asMap().entries.map((
                                  entry,
                                ) {
                                  var msges = entry.value;
                                  int index = entry.key;
                                  return Padding(
                                    padding: EdgeInsetsGeometry.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      6,
                                    ),
                                    child: index % 2 != 0
                                        ? ChatRight(
                                            widthContainer: size.width - 24,
                                            data: msges,
                                          )
                                        : ChatLeft(
                                            widthContainer: size.width - 24,
                                            data: msges,
                                          ),
                                  );
                                }).toList(),
                              ],
                            ),
                            // ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(minHeight: 45),
                                  child: AppTextArea(
                                    minLines: 1,
                                    borderRadius: 25,
                                    width: size.width - 94,
                                    border: false,
                                    backgroundColor: AppColors.white,
                                  ),
                                ),
                              ),

                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/icons/send.png',
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
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
          ),
        ],
      ),
    );
  }
}

class ChatLeft extends StatelessWidget {
  final double widthContainer;
  final Message data;
  const ChatLeft({super.key, required this.widthContainer, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: data.content.length == 1
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                data.avatar,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...data.content
                    .map(
                      (msg) => Container(
                        constraints: BoxConstraints(
                          maxWidth: widthContainer * 0.65,
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          msg,
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
        Text(
          data.time,
          style: GlobalStyles.textBold12.copyWith(color: AppColors.mediumBlack),
          softWrap: true,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

class ChatRight extends StatelessWidget {
  final double widthContainer;
  final Message data;
  const ChatRight({
    super.key,
    required this.widthContainer,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: data.content.length == 1
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...data.content
                    .map(
                      (msg) => Container(
                        constraints: BoxConstraints(
                          maxWidth: widthContainer * 0.65,
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          msg,
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            ClipOval(
              child: Image.asset(
                data.avatar,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Text(
          data.time,
          style: GlobalStyles.textBold12.copyWith(color: AppColors.mediumBlack),
          softWrap: true,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
