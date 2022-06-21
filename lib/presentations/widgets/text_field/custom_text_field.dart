import 'package:flutter/material.dart';
import 'package:weather_app/presentations/theme/app_color.dart';
import 'package:weather_app/presentations/theme/app_text.dart';

class CustomTextField extends StatefulWidget {
  final double? height;
  final double? width;
  final String? label;
  final String? subLabel;
  final String? hint;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final TextEditingController? controller;
  final bool? isObscured;
  final bool isEnabled;
  final bool isWithIcon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? pressed;
  final int? maxLength;

  CustomTextField(
      {this.height,
      this.width,
      this.label,
      this.subLabel,
      this.hint,
      this.color,
      this.borderColor,
      this.padding,
      this.margin,
      this.radius,
      this.controller,
      this.isObscured,
      this.isEnabled = true,
      this.isWithIcon = false,
      this.keyboardType,
      this.onTap,
      this.validator,
      this.suffixIcon,
      this.onChanged,
      this.focusNode,
      this.pressed,
      this.maxLength,
      this.onSuffixIconTap});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {
        _isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 48, minWidth: widget.width ?? 0),
      child: Container(
        height: widget.height,
        margin: widget.margin ?? const EdgeInsets.only(bottom: 8),
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 6)),
          border: Border.all(
              width: 1,
              color: _isFocused
                  ? AppColor.kPrimaryColor
                  : widget.borderColor ??
                      (!widget.isEnabled
                          ? Color(0xffD1DCE6).withOpacity(0.2)
                          : AppColor.kPrimaryColor.withOpacity(0.4))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.label ?? 'label',
                style: AppText.kLabel.copyWith(color: AppColor.kPrimaryColor)),
            Material(
              color: Colors.transparent,
              child: TextFormField(
                validator: widget.validator,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                focusNode: focusNode,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: widget.isObscured ?? false,
                enabled: widget.isEnabled,
                maxLength: widget.maxLength,
                // style: AppText.kBodyValue,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    counterText: "",
                    focusColor: Colors.white,
                    hintText: widget.hint,
                    isDense: true,
                    border: InputBorder.none,
                    suffixIcon: widget.isWithIcon
                        ? IconButton(
                            onPressed: widget.onSuffixIconTap,
                            icon: widget.suffixIcon ?? SizedBox())
                        : const SizedBox()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
