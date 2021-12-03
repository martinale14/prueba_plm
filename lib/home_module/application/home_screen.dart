import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plm_prueba/home_module/application/widget/register_button.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Dimens.width(context),
        height: Dimens.height(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: Dimens.top(100),
              child: Shimmer.fromColors(
                period: const Duration(milliseconds: 3000),
                highlightColor: PlmColors.pink,
                baseColor: PlmColors.deepPurple,
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                          offset: const Offset(0, 5),
                          color: Colors.black.withOpacity(.5),
                          blurRadius: 15),
                    ],
                  ),
                ),
              ),
            ),
            const RegisterButton(),
            SvgPicture.asset(
              'assets/svg/background.svg',
              width: Dimens.width(context),
            ),
          ],
        ),
      ),
    );
  }
}
