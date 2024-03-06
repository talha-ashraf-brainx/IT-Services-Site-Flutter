import 'package:flutter/material.dart';
import 'package:it_services_site/shared/constants/app_colors.dart';
import 'package:it_services_site/shared/constants/dimensions.dart';
import 'package:it_services_site/shared/constants/proportions.dart';
import 'package:it_services_site/shared/constants/view_constants.dart';

class ContactUsButton extends StatefulWidget {
  const ContactUsButton({
    super.key,
  });

  @override
  State<ContactUsButton> createState() => _ContactUsButtonState();
}

class _ContactUsButtonState extends State<ContactUsButton> {
  Color color = AppColors.primary;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextButton(
        onPressed: () {},
        onHover: onHover,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Proportions.regular, horizontal: Proportions.regular),
          child: Text(
            ViewConstants.contactUs,
            style: TextStyle(
                fontSize: Dimensions.size(context, Proportions.regular * 0.25),
                color: AppColors.white),
          ),
        ),
      ),
    );
  }

  void onHover(isHovering) {
    if (isHovering) {
      color = AppColors.hover;
    } else {
      color = AppColors.primary;
    }
    setState(() {});
  }
}
