import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/utils/app_loader_view.dart';
import 'package:southwaltoncarts_customer/app/utils/common_button.dart';
import 'package:southwaltoncarts_customer/app/utils/extension.dart';
import 'package:southwaltoncarts_customer/app/utils/validation.dart';

import '../../../../generated/assets.dart';
import '../../../theme/theme.dart';
import '../../../utils/common_appBar.dart';
import '../../../utils/common_images.dart';
import '../../../utils/common_input_text_field.dart';
import '../../../utils/strings.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.imagesTrackCartBg,
              ),
              fit: BoxFit.fill)),
      child: GestureDetector(
        onTap: ()=> context.hideKeyboard(),
        child: Scaffold(
          appBar: const CommonAppBar(
            title: Strings.contactUs,
            hasBackIcon: true,
            bgColor: Colors.transparent,
            isTitleCenter: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.height * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 0.16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: controller.nameController,
                          labelText: Strings.name,
                          focus: controller.nameFocus,
                          hintText: Strings.enterName,
                          mPadding: 18,
                          borderColor: shadow,
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          validator: (value) => Validator.validateField(
                              value, "Name can't be empty"),
                          prefixImg: const SquareSvgImageFromAsset(
                            Assets.svgIcPerson,
                            color: onPrimary,
                            size: 20,
                          ),
                        ),
                        SizedBox(height: context.height * 0.04),
                        CommonTextField(
                          controller: controller.emailController,
                          focus: controller.emailFocus,
                          labelText: Strings.email,
                          hintText: Strings.enterEmail,
                          keyboardType: TextInputType.emailAddress,
                          mPadding: 18,
                          validator: (value) => Validator.validateEmail(value),
                          borderColor: shadow,
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          prefixImg: const SquareSvgImageFromAsset(
                            Assets.svgIcMail,
                            color: onPrimary,
                            size: 20,
                          ),
                        ),
                        SizedBox(height: context.height * 0.04),
                        CommonTextField(
                          controller: controller.messageController,
                          labelText: Strings.message,
                          focus: controller.messageFocus,
                          mPadding: 18,
                          minLines: 4,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          borderColor: shadow,
                          validator: (value) => Validator.validateField(
                              value, "Message can't be empty"),
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          prefixImg: const SquareSvgImageFromAsset(
                            Assets.svgIcBookingFile,
                            color: onPrimary,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        CommonButton(
                          onPressed: () {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              AppLoaderView.loader();
                              controller.contactUs();
                            }
                          },
                          label: Strings.submit,
                          bgColor: secondary,
                          labelColor: onPrimary,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
