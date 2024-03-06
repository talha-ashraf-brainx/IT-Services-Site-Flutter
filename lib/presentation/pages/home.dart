import 'package:flutter/material.dart';
import 'package:it_services_site/presentation/widgets/home/contact_us_button.dart';
import 'package:it_services_site/presentation/widgets/home/custom_app_bar_item.dart';
import 'package:it_services_site/presentation/widgets/home/service_grid_item.dart';
import 'package:it_services_site/presentation/widgets/responsive_layout.dart';
import 'package:it_services_site/presentation/widgets/translate_fade_animation_on_scroll.dart';
import 'package:it_services_site/shared/constants/app_colors.dart';
import 'package:it_services_site/shared/constants/app_constants.dart';
import 'package:it_services_site/shared/constants/app_icons.dart';
import 'package:it_services_site/shared/constants/dimensions.dart';
import 'package:it_services_site/shared/constants/proportions.dart';
import 'package:it_services_site/shared/constants/view_constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: mobileLayout(),
      desktop: desktopLayout(),
    );
  }

  Widget mobileLayout() {
    final gridItems = getGridItems();
    const itemsInARow = 1;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            appTitle(),
            introImage(),
            servicesBox(gridItems, itemsInARow, 320)
          ],
        ),
      ),
    ));
  }

  Padding servicesBox(List<Widget> gridItems, int itemsInARow, width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Proportions.xxlarge * 3),
      child: SizedBox(
        height: (gridItems.length / itemsInARow).ceil() * 320 +
            ((gridItems.length / itemsInARow).ceil() - 1) * Proportions.xxlarge,
        width: width,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: itemsInARow,
          shrinkWrap: true,
          crossAxisSpacing: Proportions.xxlarge,
          mainAxisSpacing: Proportions.xxlarge,
          children: gridItems,
        ),
      ),
    );
  }

  Widget desktopLayout() {
    final gridItems = getGridItems();
    const itemsInARow = 3;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            appBar(),
            introImage(),
            servicesBox(gridItems, itemsInARow,
                itemsInARow * 320 + (itemsInARow - 1) * Proportions.xxlarge)
          ],
        ),
      ),
    ));
  }

  List<Widget> getGridItems() {
    return [
      ServicesGridItem(
        icon: AppIcons.android,
        title: ViewConstants.androidDevelopment,
        description: ViewConstants.androidDevelopmentDescription,
        scrollController: _scrollController,
      ),
      ServicesGridItem(
          icon: AppIcons.apple,
          title: ViewConstants.iOSDevelopment,
          description: ViewConstants.iOSDevelopmentDescription,
          scrollController: _scrollController),
      ServicesGridItem(
          icon: AppIcons.python,
          title: ViewConstants.pythonDevelopment,
          description: ViewConstants.pythonDevelopmentDescription,
          scrollController: _scrollController),
      ServicesGridItem(
          icon: AppIcons.react,
          title: ViewConstants.reactDevelopment,
          description: ViewConstants.reactDevelopmentDescription,
          scrollController: _scrollController),
      ServicesGridItem(
          icon: AppIcons.nodeJs,
          title: ViewConstants.nodeJSDevelopment,
          description: ViewConstants.nodeJSDevelopmentDescription,
          scrollController: _scrollController),
    ];
  }

  SizedBox introImage() {
    double height = Dimensions.height(context) * 0.8;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Image.network(
            AppConstants.homeIntroImageUrl,
            width: double.infinity,
            height: height,
            fit: BoxFit.cover,
          ),
          TranslateFadeAnimationOnScroll(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Proportions.xxlarge * 3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Text(
                        ViewConstants.weBuild,
                        style: TextStyle(
                            fontSize: Dimensions.size(
                                context, Proportions.regular * 0.5),
                            color: AppColors.white),
                      ),
                    ),
                    Text(
                      ViewConstants.solutions,
                      style: TextStyle(
                          fontSize:
                              Dimensions.size(context, Proportions.regular),
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    const SizedBox(
                      height: Proportions.medium,
                    ),
                    const ContactUsButton()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container appBar() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Proportions.xxlarge, horizontal: Proportions.large * 2),
        child: Row(
          children: [
            appTitle(),
            SizedBox(
              width: Dimensions.width(context) * 0.03,
            ),
            const CustomAppBarItem(text: ViewConstants.home),
            const CustomAppBarItem(text: ViewConstants.services),
            const CustomAppBarItem(text: ViewConstants.aboutUs),
            const CustomAppBarItem(text: ViewConstants.contactUs),
          ],
        ),
      ),
    );
  }

  SizedBox appTitle() {
    const headingSize = Proportions.regular * 3;
    return const SizedBox(
      child: Text(
        ViewConstants.appTitle,
        style: TextStyle(
            fontSize: headingSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white),
      ),
    );
  }
}
