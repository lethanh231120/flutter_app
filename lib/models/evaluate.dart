class EvaluateModel {
  final int id;
  final int customerId;
  final String customerAvatar;
  final String customerPhone;
  final int rating;
  final String comment;
  final String date;

  EvaluateModel({
    required this.id,
    required this.customerId,
    required this.customerAvatar,
    required this.customerPhone,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory EvaluateModel.fromJson(Map<String, dynamic> json) {
    return EvaluateModel(
      id: json['id'] ?? 0,
      customerId: json['customerId'] ?? 0,
      customerAvatar: json['customerAvatar'] ?? '',
      customerPhone: json['customerPhone'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'customerAvatar': customerAvatar,
      'customerPhone': customerPhone,
      'rating': rating,
      'comment': comment,
      'date': date,
    };
  }
}
