import 'package:flutter/material.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        gradient: PlmColors.linearGradient,
        borderRadius: Dimens.borderRadius(100),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 15,
            color: Colors.black.withOpacity(.5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: Dimens.borderRadius(100),
        child: InkWell(
          borderRadius: Dimens.borderRadius(100),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: Dimens.borderRadius(100),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
