
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/manager-assets.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/widgets/scaffold-with-background-image.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackGroundImage(
      child: Center(
        child: SvgPicture.asset(
          ManagerAssets.logo,
          width: ManagerWidth.w166,
        ),
      ),
    );
  }
}
