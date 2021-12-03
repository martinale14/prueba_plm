import 'package:flutter/material.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          gradient: PlmColors.linearGradient,
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
          onTap: () {},
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
              children: const [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Icon(
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
