import 'package:my_app/models/customer.dart';
import 'package:my_app/models/message.dart';

class ChatOverview {
  final int id;
  final int userId;
  final String userAvatar;
  final String? userName;
  final String? userPhone;
  final bool userActive;
  final String time;
  final int status;
  final String message;

  ChatOverview({
    required this.id,
    required this.userId,
    required this.userAvatar,
    this.userName,
    this.userPhone,
    required this.userActive,
    required this.time,
    required this.status,
    required this.message,
  });

  factory ChatOverview.fromJson(Map<String, dynamic> json) {
    return ChatOverview(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      userName: json['userName'] ?? '',
      userPhone: json['userPhone'] ?? '',
      userActive: json['userActive'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userAvatar': userAvatar,
      'userName': userName,
      'userPhone': userPhone,
      'userActive': userActive,
      'time': time,
      'status': status,
      'message': message,
    };
  }
}

class ChatDetail {
  final int id;
  final List<Customer> userPair;
  final List<Message> messages;

  ChatDetail({
    required this.id,
    required this.userPair,
    required this.messages,
  });

  factory ChatDetail.fromJson(Map<String, dynamic> json) {
    return ChatDetail(
      id: json['id'] ?? '',
      userPair: (json['userPair'] as List<dynamic>)
          .map((e) => Customer.fromJson(e))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userPair': userPair.map((e) => e.toJson()).toList(),
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }
}
