import 'package:flutter/material.dart';
import 'package:it_services_site/shared/constants/app_colors.dart';
import 'package:it_services_site/shared/constants/proportions.dart';

class CustomAppBarItem extends StatefulWidget {
  const CustomAppBarItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<CustomAppBarItem> createState() => _CustomAppBarItemState();
}

class _CustomAppBarItemState extends State<CustomAppBarItem> {
  Color color = AppColors.white;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Proportions.xxlarge,
        ),
        child: InkWell(
          onHover: onHover,
          onTap: () {},
          child: Text(
            widget.text,
            style: TextStyle(color: color),
          ),
        ),
      );

  void onHover(value) {
    if (value) {
      color = AppColors.hover;
    } else {
      color = AppColors.white;
    }
    setState(() {});
  }
}
