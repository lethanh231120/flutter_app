import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';

class AppUploadImage extends StatefulWidget {
  final double size;
  final bool isCircle;
  final bool fullWidth;
  final double customSizeIcon;
  final Function(File file)? onChanged;

  const AppUploadImage({
    super.key,
    this.size = 90,
    this.isCircle = false,
    this.fullWidth = false,
    this.customSizeIcon = 55,
    this.onChanged,
  });
  @override
  _AppUploadImageState createState() => _AppUploadImageState();
}

class _AppUploadImageState extends State<AppUploadImage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (!mounted || pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
    widget.onChanged?.call(File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: widget.isCircle ? null : BorderRadius.circular(12),
          border: widget.fullWidth
              ? null
              : Border.all(color: AppColors.mediumBlack),
          color: widget.fullWidth ? Colors.transparent : AppColors.grey,
        ),
        clipBehavior: Clip.hardEdge,
        child: _image == null
            ? _buildPlaceholder()
            : Image.file(_image!, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return widget.fullWidth
        ? Image.asset(
            'assets/icons/upload_primary.png',
            width: widget.size,
            height: widget.size,
            fit: BoxFit.cover,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/upload_primary.png',
                width: widget.customSizeIcon,
                height: widget.customSizeIcon,
                fit: BoxFit.cover,
              ),
              Text('Chọn ảnh', style: GlobalStyles.textBold12),
            ],
          );
  }
}
