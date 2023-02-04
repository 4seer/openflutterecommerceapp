import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterMenuLine extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const OpenFlutterMenuLine(
      {
      required this.title,
      required this.subtitle,
      required this.onTap})
      ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: AppColors.lightGray, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.chevron_right),
      ),
      onTap: onTap,
    );
  }
}
