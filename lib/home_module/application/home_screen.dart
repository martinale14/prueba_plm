import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plm_prueba/home_module/application/widget/custom_button.dart';
import 'package:plm_prueba/home_module/application/widget/terms_dialog.dart';
import 'package:plm_prueba/home_module/infraestructure/home_provider.dart';
import 'package:plm_prueba/home_module/infraestructure/preferences_service.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = context.watch<HomeProvider>();
    return Scaffold(
      body: FutureBuilder(
          future: PreferencesService.getAcceptedTerms(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (!snapshot.data!) {
                WidgetsBinding.instance!.addPostFrameCallback(
                  (_) {
                    if (!provider.isShowing) {
                      provider.isShowing = true;
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => TermsDialog(
                          provider: provider,
                        ),
                      );
                    }
                  },
                );
              }
            }
            return SizedBox(
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
                  CustomButton(
                    text: 'Register',
                    gradient: PlmColors.linearGradient,
                    onTap: () {},
                  ),
                  SvgPicture.asset(
                    'assets/svg/background.svg',
                    width: Dimens.width(context),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
