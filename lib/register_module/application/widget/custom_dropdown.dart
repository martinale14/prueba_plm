import 'package:flutter/material.dart';
import 'package:plm_prueba/register_module/infraestructure/register_provider.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
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
    return Container(
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
                color:
                    validationText.isEmpty ? PlmColors.deepPurple : Colors.red,
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
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.arrow_downward_rounded,
                    color: PlmColors.deepPurple,
                  ),
                  isExpanded: true,
                  value: provider.documentType,
                  decoration: const InputDecoration.collapsed(
                    hintText: '',
                    border: InputBorder.none,
                  ),
                  onTap: () {},
                  onChanged: (String? value) {
                    provider.documentType = value!;
                  },
                  items: <String>[
                    '',
                    'Tarjeta de identidad',
                    'Cedula de Ciudadania',
                    'Cedula Extranjera',
                  ]
                      .map(
                        (String item) => DropdownMenuItem(
                          child: Text(
                            item,
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 20,
                            ),
                          ),
                          value: item,
                        ),
                      )
                      .toList(),
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
    );
  }
}
