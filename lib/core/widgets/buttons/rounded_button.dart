import 'package:e_library/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.onPressed,
    this.label,
    this.icon,
    this.iconColor,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 18,
    this.iconSize = 18,
    this.buttonColor,
    this.labelColor,
    this.borderColor,
    this.radius,
    this.height,
    this.width,
    this.pdh,
    this.pdv,
    this.elevation,
    this.isIcon = false,
    this.isRight = false,
    this.isLoad = false,
    super.key,
  });

  final String? label;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? labelColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double iconSize;
  final BorderRadius? radius;
  final double? height;
  final double? width;
  final double? pdv;
  final double? pdh;
  final double? elevation;
  final bool? isIcon;
  final bool? isRight;
  final bool? isLoad;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 1,
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        foregroundColor: labelColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: radius ?? BorderRadius.circular(9),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        minimumSize: Size(width ?? double.maxFinite, height ?? 50),
        padding: EdgeInsets.symmetric(horizontal: pdh ?? 0, vertical: pdv ?? 0),
      ),
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    if (label != null && isIcon == false) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isLoad == true) ...[
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: AppColors.secondaryColor,
              ),
            ),
            const Gap(7),
          ],
          Text(
            label!,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ],
      );
    } else if (isIcon == true && label != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isRight == false
              ? Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                )
              : const SizedBox.shrink(),
          const Gap(7),
          Text(
            label!,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
          isRight == true
              ? Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                )
              : const SizedBox.shrink()
        ],
      );
    } else if (isIcon == true && label == null) {
      return Icon(
        icon,
        size: iconSize,
        color: iconColor,
      );
    } else {
      return Container();
    }
  }
}
