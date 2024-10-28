import 'package:e_library/core/theme/app_colors.dart';
import 'package:e_library/core/utils/dashed_painter_widget.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    this.focusNode,
    this.filled = false,
    this.obscuredText = false,
    this.readOnly = false,
    this.isShadow = true,
    this.overrideValidator = false,
    this.arrowsWidth = 24,
    this.arrowsHeight = kMinInteractiveDimension,
    this.isDashedBorder,
    super.key,
    this.validator,
    this.fillColor,
    this.bgColor,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.suffixText,
    this.keyboardType,
    this.hintStyle,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.height,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool filled;
  final Color? fillColor;
  final Color? bgColor;
  final bool obscuredText;
  final bool readOnly;
  final double arrowsWidth;
  final double arrowsHeight;
  final double? height;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? suffixText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final bool? isShadow;
  final bool? isDashedBorder;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: widget.isShadow! ? [defaultBoxShadow] : [],
      ),
      child: Stack(
        children: [
          if (widget.isDashedBorder == true)
            Positioned.fill(
              child: CustomPaint(
                painter: DashedBorderPainter(),
              ),
            ),
          TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            onTap: widget.onTap,
            validator: widget.overrideValidator
                ? widget.validator
                : (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _errorText =
                            widget.hintText ?? 'This field is required';
                      });
                      return null;
                    } else {
                      setState(() {
                        _errorText = null;
                      });
                    }
                    return widget.validator?.call(value);
                  },
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscuredText,
            readOnly: widget.readOnly,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primaryColor.withOpacity(0.5),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 13.5),
              filled: widget.filled,
              fillColor: widget.fillColor,
              suffixIcon: widget.suffixIcon,
              suffixText: widget.suffixText,
              suffixStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.textFieldColor,
                fontWeight: FontWeight.normal,
              ),
              prefixIcon: widget.prefixIcon,
              hintText: _errorText ?? widget.hintText,
              hintStyle: widget.hintStyle?.copyWith(
                      color: _errorText != null
                          ? Colors.red
                          : AppColors.textFieldColor) ??
                  TextStyle(
                    fontSize: 14,
                    color: _errorText != null
                        ? Colors.red
                        : AppColors.textFieldColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
