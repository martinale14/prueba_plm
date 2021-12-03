import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plm_prueba/home_module/application/widget/custom_button.dart';
import 'package:plm_prueba/home_module/infraestructure/home_provider.dart';
import 'package:plm_prueba/home_module/infraestructure/preferences_service.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';

class TermsDialog extends StatelessWidget {
  TermsDialog({Key? key, required this.provider}) : super(key: key);

  final HomeProvider provider;
  final ValueNotifier<bool> accepted = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: Dimens.borderRadius(10),
      ),
      child: Container(
        padding: Dimens.all(10),
        height: 520,
        width: Dimens.scaleX(context, .85),
        child: ValueListenableBuilder(
          valueListenable: accepted,
          builder: (BuildContext context, bool value, Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [PlmColors.deepPurple, PlmColors.pink])
                        .createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: const Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: Dimens.all(10),
                  height: 350,
                  width: Dimens.scaleX(context, .85) - 10,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: Dimens.borderRadius(5),
                  ),
                  child: const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: PlmColors.deepPurple,
                      value: value,
                      onChanged: (bool? checked) {
                        accepted.value = checked!;
                      },
                    ),
                    const Text(
                      'I agree to terms and conditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                CustomButton(
                  text: 'Continue',
                  onTap: () async {
                    if (value) {
                      try {
                        await PreferencesService.saveAcceptedTerms(value);
                        provider.isAccepted = true;
                        Fluttertoast.showToast(
                          msg: 'Terms Accepted',
                          backgroundColor: Colors.red,
                          toastLength: Toast.LENGTH_LONG,
                          fontSize: 20,
                        );
                        Navigator.of(context).pop();
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: 'There was an error saving preferences',
                          backgroundColor: Colors.red,
                          toastLength: Toast.LENGTH_LONG,
                          fontSize: 20,
                        );
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: 'you must accept terms and conditons to continue',
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 20,
                      );
                    }
                  },
                  gradient: value
                      ? PlmColors.linearGradient
                      : LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(1),
                            Colors.grey.withOpacity(1)
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
