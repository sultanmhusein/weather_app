import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentations/theme/app_color.dart';
import 'package:weather_app/presentations/theme/app_text.dart';

class CustomSearchableDropdown extends StatefulWidget {
  final String? label;
  final List<String>? list;
  final String? selectedItem;
  final void Function(String?)? onChanged;

  CustomSearchableDropdown(
      {this.label, this.list, this.selectedItem, required this.onChanged});

  @override
  State<CustomSearchableDropdown> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomSearchableDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: AppColor.kPrimaryColor.withOpacity(0.4), width: 1.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 8, left: 12),
              child: Text(widget.label ?? "Label",
                  style:
                      AppText.kLabel.copyWith(color: AppColor.kPrimaryColor))),
          DropdownSearch<String>(
              mode: Mode.MENU,
              showSearchBox: true,
              showSelectedItem: true,
              items: widget.list,
              selectedItem: widget.selectedItem,
              searchBoxStyle:
                  AppText.kBodyValue.copyWith(color: AppColor.kBlackSoftColor),
              dropDownButton: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.kPrimaryColor.withOpacity(0.2)),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              ),
              dropdownSearchBaseStyle: AppText.kBodyValue,
              dropdownSearchDecoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 12)),
              onChanged: widget.onChanged),
        ],
      ),
    );
  }
}
