class Customer {
  final int id;
  final String phone;
  final String avatar;
  final String? name;
  final bool? active;
  final String? ticketStatus; // trạng thái thu vé
  final String? routeCusCmt; // comment của khách hàng trong chuyến
  final String? priceRoute; // giá chuyến

  Customer({
    required this.id,
    required this.phone,
    required this.avatar,
    this.name,
    this.active,
    this.ticketStatus,
    this.routeCusCmt,
    this.priceRoute,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      name: json['name'] ?? '',
      active: json['active'] ?? '',
      ticketStatus: json['ticketStatus'] ?? '',
      routeCusCmt: json['routeCusCmt'] ?? '',
      priceRoute: json['priceRoute'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'avatar': avatar,
      'name': name,
      'active': active,
      'ticketStatus': ticketStatus,
      'routeCusCmt': routeCusCmt,
      'priceRoute': priceRoute,
    };
  }
}
