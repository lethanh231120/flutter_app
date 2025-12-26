import 'package:my_app/models/province.dart';

class Trip {
  final String id; // id
  final String? startPoint; // điểm đầu
  final String? endPoint; // điểm cuối
  final String? startTime; // thời gian xuất phát (có thể có thêm ngày)
  final String? price; // giá vé
  final Province? startProvince; // tỉnh xuất phát
  final Province? endProvince; // tỉnh đến
  final int? status; // trạng thái chuyến
  final int? seatsBooked; // số ghế đã đặt

  final String? owner; // chủ xe
  final String driveImage; // ảnh
  final String? driveName; // tên xe
  final String? vehicleType; // Loại xe: xe giường nằm, limousine....
  final int? seats; // tổng số ghế
  final String? plateNumber; // biển số
  final List<String>? attributes; // thuộc tính: điều hòa, ....

  Trip({
    required this.id,
    required this.driveImage,
    this.driveName,
    this.endPoint,
    this.owner,
    this.price,
    this.startPoint,
    this.startTime,
    this.endProvince,
    this.startProvince,
    this.vehicleType,
    this.seats,
    this.plateNumber,
    this.attributes,
    this.status,
    this.seatsBooked,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      driveName: json['driveName'] ?? '',
      driveImage: json['driveImage'] ?? '',
      owner: json['owner'] ?? '',
      endPoint: json['endPoint'] ?? '',
      price: json['price'] ?? '',
      startPoint: json['startPoint'] ?? '',
      startTime: json['startTime'] ?? '',
      startProvince: Province.fromJson(json['sttartProvince']),
      endProvince: Province.fromJson(json['endProvince']),
      vehicleType: json['vehicleType'] ?? '',
      seats: json['seats'] ?? '',
      seatsBooked: json['seatsBooked'] ?? '',
      plateNumber: json['plateNumber'] ?? '',
      attributes: json['attributes'] != null
          ? (json['attributes'] as List<dynamic>)
                .map((e) => e.toString())
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'driveImage': driveImage,
      'driveName': driveName,
      'owner': owner,
      'endPoint': endPoint,
      'price': price,
      'startPoint': startPoint,
      'startTime': startTime,
      'startProvince': startProvince!.toJson(),
      'endProvince': endProvince!.toJson(),
      'vehicleType': vehicleType,
      'seats': seats,
      'seatsBooked': seatsBooked,
      'plateNumber': plateNumber,
      'attributes': attributes,
    };
  }
}
