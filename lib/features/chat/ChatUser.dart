import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/chat.dart';
import 'package:my_app/widgets/AppTag.dart';

class ChatUser extends StatefulWidget {
  final ChatOverview chatItem;
  const ChatUser({super.key, required this.chatItem});

  @override
  State<ChatUser> createState() => _ChatUser();
}

class _ChatUser extends State<ChatUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => context.push(
        '/chat-detail',
        extra: {'ownerId': 2, 'customerId': widget.chatItem.userId},
      ),
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border)),
          color: AppColors.white,
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SizedBox(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.chatItem.userAvatar),
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
                        widget.chatItem.userPhone!,
                        style: GlobalStyles.textBold14.copyWith(
                          color: widget.chatItem.status == 1
                              ? AppColors.semiBlack
                              : AppColors.black,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: widget.chatItem.userActive
                              ? AppColors.btnSuccess
                              : AppColors.btnError,
                        ),
                      ),
                      Spacer(),
                      Text(
                        widget.chatItem.time,
                        style: GlobalStyles.textBold12.copyWith(
                          color: widget.chatItem.status == 1
                              ? AppColors.semiBlack
                              : AppColors.black,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),

                  Text(
                    widget.chatItem.message,
                    style: GlobalStyles.textBold12.copyWith(
                      color: AppColors.semiBlack,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
