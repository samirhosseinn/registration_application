import 'package:flutter/material.dart';
import 'size_config.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portraiteLayout;
  final Widget landscapeLayout;

  const ResponsiveWidget(
    this.portraiteLayout,
    this.landscapeLayout, 
    Key? key,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isPortrait && SizeConfig.isMobilePortrait) {
      return portraiteLayout;
    } else {
      return landscapeLayout;
    }
  }
}
