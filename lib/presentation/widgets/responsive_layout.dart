import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.desktop,
    this.tablet,
  });
  final Widget mobile;
  final Widget? desktop;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 451) {
        return mobile;
      } else if (constraints.maxWidth < 801) {
        if (tablet == null) return mobile;
        return tablet!;
      } else {
        if (desktop == null) return mobile;
        return desktop!;
      }
    });
  }
}
