import 'package:flutter/widgets.dart';
import '../theme/app_colors.dart';

class Typography extends StatelessWidget {
  final String data;
  final FontWeight weight;
  final double size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? height;

  const Typography(
    this.data, {
    super.key,
    this.weight = FontWeight.normal,
    this.size = 26,
    this.color,
    this.textAlign,
    this.maxLines,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: size,
        fontWeight: weight,
        color: color ?? AppColors.textPrimary,
        height: height ?? 1.4,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}
