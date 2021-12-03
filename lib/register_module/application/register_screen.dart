import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plm_prueba/home_module/application/widget/custom_button.dart';
import 'package:plm_prueba/home_module/application/widget/shimmer_text.dart';
import 'package:plm_prueba/register_module/application/widget/custom_birthday_input.dart';
import 'package:plm_prueba/register_module/application/widget/custom_circular_button.dart';
import 'package:plm_prueba/register_module/application/widget/custom_dropdown.dart';
import 'package:plm_prueba/register_module/application/widget/custom_input.dart';
import 'package:plm_prueba/register_module/application/widget/return_button.dart';
import 'package:plm_prueba/register_module/domain/upload_item.dart';
import 'package:plm_prueba/register_module/infraestructure/register_provider.dart';
import 'package:plm_prueba/register_module/infraestructure/register_service.dart';
import 'package:plm_prueba/register_module/infraestructure/register_validation_service.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:plm_prueba/utils/dimens.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final RegisterProvider provider = context.watch<RegisterProvider>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              focusNode.requestFocus();
              debugPrint('request');
            },
            child: SizedBox(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: Dimens.symetric(h: 20, v: 20),
                        child: const ReturnButton(),
                      ),
                    ),
                    const ShimmerText(text: 'Register'),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomInput(
                      icon: Icons.person,
                      controller: provider.nameController,
                      validationText: '',
                      label: '* Name',
                      onChange: (String value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                      icon: Icons.person,
                      controller: provider.lastNameController,
                      validationText: '',
                      label: '* Lastname',
                      onChange: (String value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                      icon: Icons.email,
                      controller: provider.emailController,
                      validationText: provider.emailValidationText ?? '',
                      label: '* Email',
                      type: TextInputType.emailAddress,
                      onChange: (String value) {
                        provider.emailValidationText =
                            RegisterValidationService.validateEmail(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropdown(
                      label: '* Document Type',
                      icon: Icons.card_travel,
                      provider: provider,
                      validationText: '',
                      onChange: (String value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                      icon: Icons.confirmation_number,
                      controller: provider.documentNumberController,
                      validationText: provider.cedulaValidationText ?? '',
                      label: '* Document number',
                      type: TextInputType.number,
                      onChange: (String value) {
                        provider.cedulaValidationText =
                            RegisterValidationService.validateCedula(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                      icon: Icons.phone,
                      controller: provider.phoneController,
                      validationText: provider.phoneValidationText ?? '',
                      label: '* Phone number',
                      type: TextInputType.number,
                      onChange: (String value) {
                        provider.phoneValidationText =
                            RegisterValidationService.validatePhone(value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomBirthdayInput(
                      icon: Icons.calendar_today,
                      provider: provider,
                      validationText: '',
                      label: '* Birthday',
                      onChange: (String value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircularButton(
                          onTap: () async {
                            File? file = await RegisterService.getImage(true);
                            if (file != null) {
                              provider.imageFile = file;
                            }
                          },
                          icon: Icons.camera_alt,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        CustomCircularButton(
                          onTap: () async {
                            File? file = await RegisterService.getImage(false);
                            if (file != null) {
                              provider.imageFile = file;
                            }
                          },
                          icon: Icons.file_present,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    provider.imageFile == null
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 200,
                            child: Image.file(provider.imageFile!),
                          ),
                    const SizedBox(
                      height: 80,
                    ),
                    CustomButton(
                      text: 'Send',
                      gradient: PlmColors.linearGradient,
                      onTap: () async {
                        if (provider.birthday == '' ||
                            provider.documentType == '' ||
                            provider.cedulaValidationText != null ||
                            provider.emailValidationText != null ||
                            provider.phoneValidationText != null ||
                            provider.cedulaValidationText != null ||
                            provider.nameController.text == '' ||
                            provider.lastNameController.text == '' ||
                            provider.imageFile == null) {
                          Fluttertoast.showToast(
                            msg:
                                'Please fill all the fields and remember to choose an image',
                            toastLength: Toast.LENGTH_LONG,
                          );
                        } else {
                          bool status = await RegisterService.uploadData(
                            UploadItem(
                              name: provider.nameController.text,
                              lastname: provider.lastNameController.text,
                              typeDocument: provider.documentType,
                              documentNumber:
                                  provider.documentNumberController.text,
                              email: provider.emailController.text,
                              phone: provider.phoneController.text,
                              birthday: provider.birthday,
                              image: provider.imageFile!,
                            ),
                          );

                          if (status) {
                            Fluttertoast.showToast(
                              msg: 'Data uploaded succesfully',
                              toastLength: Toast.LENGTH_LONG,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'The endpoint can´t be reached',
                              toastLength: Toast.LENGTH_LONG,
                            );
                          }

                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
