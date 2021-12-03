import 'package:flutter/material.dart';
import 'package:plm_prueba/register_module/infraestructure/register_provider.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';

class CustomBirthdayInput extends StatelessWidget {
  const CustomBirthdayInput({
    Key? key,
    this.label = 'input',
    this.type,
    required this.icon,
    this.hideContent = false,
    required this.provider,
    required this.validationText,
    required this.onChange,
  }) : super(key: key);

  final String label;
  final TextInputType? type;
  final IconData icon;
  final bool hideContent;
  final RegisterProvider provider;
  final Function(String) onChange;
  final String validationText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? birth = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1920),
            lastDate: DateTime.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData(
                  primaryColor: PlmColors.deepPurple,
                  backgroundColor: PlmColors.deepPurple,
                  colorScheme: ColorScheme(
                    primary: PlmColors.deepPurple,
                    primaryVariant: PlmColors.deepPurple,
                    secondary: PlmColors.deepPurple,
                    secondaryVariant: PlmColors.deepPurple,
                    surface: PlmColors.deepPurple,
                    background: PlmColors.deepPurple,
                    error: PlmColors.deepPurple,
                    onPrimary: Colors.white,
                    onSecondary: Colors.black,
                    onSurface: Colors.black,
                    onBackground: Colors.black,
                    onError: Colors.black,
                    brightness: Brightness.light,
                  ),
                ),
                child: child!,
              );
            });
        provider.birthday =
            birth == null ? '' : '${birth.day}/${birth.month}/${birth.year}';
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Dimens.scaleX(context, .8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: validationText.isEmpty
                      ? PlmColors.deepPurple
                      : Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 55,
                  width: Dimens.scaleX(context, .8) + 5,
                  decoration: BoxDecoration(
                      borderRadius: Dimens.borderRadius(100),
                      gradient: validationText.isEmpty
                          ? PlmColors.linearGradient
                          : const LinearGradient(
                              colors: [Colors.red, Colors.red])),
                ),
                Container(
                  padding: Dimens.symetric(h: 20, v: 10),
                  width: Dimens.scaleX(context, .8),
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: Dimens.borderRadius(100),
                      color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        child: Icon(
                          icon,
                          color: PlmColors.deepPurple,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            provider.birthday,
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            validationText.isEmpty
                ? const SizedBox(
                    height: 0,
                    width: 0,
                  )
                : const SizedBox(
                    height: 10,
                  ),
            Container(
              alignment: Alignment.centerLeft,
              padding: Dimens.symetric(h: 50, v: 0),
              child: validationText.isEmpty
                  ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : Row(
                      children: [
                        const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            validationText,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
