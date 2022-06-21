import 'package:flutter/material.dart';
import 'package:weather_app/presentations/theme/app_text.dart';

class CustomContent extends StatelessWidget {
  final ImageProvider<Object> icon;
  final String text;

  CustomContent({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Image(
            image: icon,
            height: 20,
            width: 20,
          ),
          SizedBox(
            height: 8,
          ),
          Text(text, style: AppText.kLabel),
        ],
      ),
    );
  }
}
