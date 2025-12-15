// import 'package:flutter/material.dart';

// Color hexToColor(String hex, {double opacity = 1.0}) {
//   if (hex.isEmpty) throw ArgumentError('Hex string không được rỗng');

//   // Xóa # và khoảng trắng
//   hex = hex.replaceAll('#', '').trim();

//   // Xử lý 3 ký tự → 6 ký tự (fff → ffffff)
//   if (hex.length == 3) {
//     hex = hex.split('').map((c) => c + c).join();
//   }

//   // Nếu chỉ có 6 ký tự → tự động thêm FF (alpha = 255)
//   if (hex.length == 6) {
//     hex = 'FF$hex';
//   }

//   // Bắt buộc phải là 8 ký tự (có alpha)
//   if (hex.length != 8) {
//     throw FormatException(
//       'Hex color không hợp lệ: #$hex (length = ${hex.length})',
//     );
//   }

//   final int colorValue = int.parse(hex, radix: 16);

//   // DÙNG .withValues() → chuẩn mới, KHÔNG deprecated, chính xác tuyệt đối
//   return Color(colorValue).withValues(alpha: opacity);
// }
