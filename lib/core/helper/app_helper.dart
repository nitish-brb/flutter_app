// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../presentations/widgets/custom_widgets/custom_button.dart';
import '../constants/constant_imports.dart';
import 'helper_imports.dart';

class AppHelper {
  static void printWrapped(String text) {
    final pattern = RegExp('.{1,100}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static Future<void> onSessionExpired() async {
    await SharedPrefHelper.clear();
    //RoutingHelper.pushAndRemoveUntilToScreen(screen: const LoginView());
  }

  static void dismissKeyboard() {
    final currentFocus =
        FocusScope.of(AppConstants.globalNavKey.currentContext!);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String), fit: BoxFit.cover);
  }

  static void dismissSnackBar({required BuildContext ctx}) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
  }

  static String formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  static String generateCaptcha() {
    const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const length = 6;
    final random = Random();
    final randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    AppLogger.log("the random string is $randomString");
    return randomString;
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SizedBox(
            height: Dimensions.px32,
            child: Text(
              message,
              style: AppTextStyles.regularText(
                  fontSize: Dimensions.px18, color: ColorConstants.white),
            ),
          ),
        ),
      );
    }
  }

  static Future<File?> getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return null;
      }
      var imageTemporary = File(image.path);
      return imageTemporary;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
      return null;
    }
  }

  static Future<LoginUserType> getLoginUserStringToEnum(String value) async {
    return LoginUserType.values.byName(value);
  }

  static Future<AuthenticationType> getAuthModeStringToEnum(
      String value) async {
    return AuthenticationType.values.byName(value);
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static Future<void> showProgressDialogue<T>() async {
    await showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      },
      context: AppConstants.globalNavKey.currentContext!,
    );
  }

  static Future<void> showSimpleDialogue<T>({
    bool showOkayButton = false,
    Widget? showIcon,
    bool showNoButton = false,
    String cancelBtnTitle = 'cancel',
    String okBtnTitle = 'Ok',
    String title = 'Alert',
    String message = '',
    final VoidCallback? onTap,
    final VoidCallback? onTapCancel,
  }) async {
    await showDialog<T>(
      barrierDismissible: false,
      context: AppConstants.globalNavKey.currentContext!,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              width: SizeHelper.getDeviceWidth(context) / Dimensions.px1,
              decoration: BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(Dimensions.px10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.px20, horizontal: Dimensions.px20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (showIcon != null) showIcon,
                    const SizedBox(height: Dimensions.px10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBoldText(
                        fontSize: Dimensions.px17,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.px10,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regularText(
                        fontSize: Dimensions.px13,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.px15,
                    ),
                    Row(
                      mainAxisAlignment: showOkayButton && showNoButton
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: <Widget>[
                        if (showNoButton)
                          CustomButton(
                              width: Dimensions.px120,
                              style: AppTextStyles.semiBoldText(
                                  fontSize: Dimensions.px16,
                                  color: ColorConstants.white),
                              label: cancelBtnTitle,
                              btnColor: ColorConstants.persianRed,
                              onTap: onTapCancel),
                        if (showNoButton && showOkayButton)
                          const SizedBox(
                            width: Dimensions.px10,
                          ),
                        if (showOkayButton)
                          CustomButton(
                            width: Dimensions.px120,
                            style: AppTextStyles.semiBoldText(
                                fontSize: Dimensions.px16,
                                color: ColorConstants.white),
                            label: okBtnTitle,
                            btnColor: ColorConstants.persianRed,
                            onTap: onTap,
                          )
                      ],
                    ),
                    const SizedBox(height: Dimensions.px10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showJobsTypesDialogue<T>({
    bool showOkayButton = false,
    bool showIcon = false,
    bool showNoButton = false,
    String cancelBtnTitle = 'cancel',
    String okBtnTitle = 'Ok',
    String title = 'Alert',
    String message = '',
    double? insetPadding,
    final VoidCallback? onTap,
    required Widget child,
  }) async {
    await showDialog<T>(
      barrierDismissible: false,
      context: AppConstants.globalNavKey.currentContext!,
      builder: (context) {
        return Dialog(
          insetPadding: insetPadding == null
              ? null
              : EdgeInsets.symmetric(horizontal: insetPadding),
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
                width: SizeHelper.getDeviceWidth(context) / Dimensions.px1,
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(Dimensions.px10)),
                child: child),
          ),
        );
      },
    );
  }

  static getVerificationType(LoginUserType loginUserEnumType) {
    switch (loginUserEnumType) {
      case LoginUserType.dno:
        return "3";
      case LoginUserType.ino:
        return "1";
      case LoginUserType.hoi:
        return "2";
    }
  }

  static void saveSessionID(num? id, LoginUserType loginUserType) {
    AppLogger.log("saveSessionID: id:$id,loginUserType:${loginUserType.name}");
    if (loginUserType == LoginUserType.hoi) {
      SharedPrefHelper.setInt(SharedPrefs.hoiSessionID, id!.toInt());
    }
    if (loginUserType == LoginUserType.ino) {
      SharedPrefHelper.setInt(SharedPrefs.inoSessionID, id!.toInt());
    }
  }

  static Future<int?> getSessionID(LoginUserType loginUserType) async {
    if (loginUserType == LoginUserType.hoi) {
      return await SharedPrefHelper.getInt(SharedPrefs.hoiSessionID);
    }
    if (loginUserType == LoginUserType.ino) {
      return await SharedPrefHelper.getInt(SharedPrefs.inoSessionID);
    }
    return null;
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  static String getErrorMessages(Map<String, dynamic> jsonData) {
    AppLogger.log("verify uid response in API impl: $jsonData");
    final result = jsonData['result'];
    if (result.isNotEmpty) {
      return result.entries.first.value;
    } else {
      return jsonData['message'];
    }
  }
}
