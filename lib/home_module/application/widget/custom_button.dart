import 'package:flutter/material.dart';
import 'package:plm_prueba/utils/dimens.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.gradient,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final LinearGradient gradient;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: Dimens.borderRadius(100),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 15,
              color: Colors.black.withOpacity(.5),
            ),
          ]),
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
