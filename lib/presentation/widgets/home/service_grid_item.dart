import 'package:flutter/material.dart';
import 'package:it_services_site/presentation/widgets/translate_fade_animation_on_scroll.dart';
import 'package:it_services_site/shared/constants/app_assets.dart';
import 'package:it_services_site/shared/constants/app_colors.dart';
import 'package:it_services_site/shared/constants/proportions.dart';

class ServicesGridItem extends StatefulWidget {
  const ServicesGridItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      this.scrollController});

  final String icon;
  final String title;
  final String description;
  final ScrollController? scrollController;

  @override
  State<ServicesGridItem> createState() => _ServicesGridItemState();
}

class _ServicesGridItemState extends State<ServicesGridItem> {
  @override
  Widget build(BuildContext context) {
    return TranslateFadeAnimationOnScroll(
      scrollController: widget.scrollController,
      child: InkWell(
        child: Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Proportions.xxlarge),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                '${AppAssets.icons}/${widget.icon}',
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: Proportions.xxlarge * 2,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: Proportions.xxlarge * 1.3,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: Proportions.xxlarge,
              ),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.textLight,
                    fontSize: Proportions.xlarge,
                    fontWeight: FontWeight.w500),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
