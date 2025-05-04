import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  final String path;
  final double? height;
  final double? width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path, height: height, width: width, fit: fit);
  }
}
