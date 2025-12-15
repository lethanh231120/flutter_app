class Customer {
  final int id;
  final String phone;
  final String avatar;
  final String? name;
  final bool? active;

  Customer({
    required this.id,
    required this.phone,
    required this.avatar,
    this.name,
    this.active,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      name: json['name'] ?? '',
      active: json['active'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'avatar': avatar,
      'name': name,
      'active': active,
    };
  }
}
