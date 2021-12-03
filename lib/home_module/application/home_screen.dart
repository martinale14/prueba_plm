import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plm_prueba/home_module/application/widget/custom_button.dart';
import 'package:plm_prueba/home_module/application/widget/shimmer_text.dart';
import 'package:plm_prueba/home_module/application/widget/terms_dialog.dart';
import 'package:plm_prueba/home_module/infraestructure/home_provider.dart';
import 'package:plm_prueba/home_module/infraestructure/preferences_service.dart';
import 'package:plm_prueba/register_module/application/register_injection.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';
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
                    child: const ShimmerText(
                      text: 'WELCOME',
                    )),
                CustomButton(
                  text: 'Register',
                  gradient: PlmColors.linearGradient,
                  onTap: () {
                    if (snapshot.data!) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return RegisterInjection.injection();
                        }),
                      );
                    }
                  },
                ),
                SvgPicture.asset(
                  'assets/svg/background.svg',
                  width: Dimens.width(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
