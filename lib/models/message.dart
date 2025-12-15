class Message {
  final int id;
  final String time;
  final List<String> content;
  final int userId;
  final String avatar;

  Message({
    required this.id,
    required this.time,
    required this.content,
    required this.userId,
    required this.avatar,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      time: json['time'] ?? '',
      content: List<String>.from(json['content']),
      userId: json['userId'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'content': content,
      'userId': userId,
      'avatar': avatar,
    };
  }
}
