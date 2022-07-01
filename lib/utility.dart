// // ignore_for_file: unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison

// import 'dart:math';
// import 'dart:typed_data';

// // import 'package:auto_orientation/auto_orientation.dart';
// // import 'package:connectivity/connectivity.dart';
// // import 'package:assets_audio_player/assets_audio_player.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
// // import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// // import 'config.dart';
// final List<String> kColorPalette = [
//   '#655EB0',
//   '#DB2355',
//   '#FD8B43',
//   '#67C392',
//   '#655EB0',
//   '#a4bcf8',
//   '#DB2355',
//   '#FD8B43',
// ];

// enum AppOrientation { PORTRAIT, LANDSCAPE, AUTO }

// class Utility {
//   static AppOrientation getAppOrientation(String orientation) {
//     switch (orientation) {
//       case 'portrait':
//         return AppOrientation.PORTRAIT;
//       case 'landscape':
//         return AppOrientation.LANDSCAPE;
//       case 'auto':
//         return AppOrientation.AUTO;
//       default:
//         return AppOrientation.PORTRAIT;
//     }
//   }

//   //#region Region - Play Sound
//   static playSound(String soundPath) {
//     try {
//       print(soundPath);
//       // AssetsAudioPlayer.playAndForget(Audio(soundPath),
//       //     respectSilentMode: false);
//     } catch (exception) {
//       print(exception);
//     }
//   }

//   //#endregion

//   static String getOrientation(AppOrientation appOrientation) {
//     switch (appOrientation) {
//       case AppOrientation.PORTRAIT:
//         return 'portrait';
//       case AppOrientation.LANDSCAPE:
//         return 'landscape';
//       case AppOrientation.AUTO:
//         return 'auto';
//       default:
//         return 'portrait';
//     }
//   }

//   static void setAppOrientation(AppOrientation orientation) {
//     switch (orientation) {
//       case AppOrientation.PORTRAIT:
//         SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//         break;
//       case AppOrientation.LANDSCAPE:
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.landscapeLeft,
//           DeviceOrientation.landscapeRight
//         ]);
//         break;
//       case AppOrientation.AUTO:
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.landscapeLeft,
//           DeviceOrientation.landscapeRight,
//           DeviceOrientation.portraitUp
//         ]);
//         break;
//     }
//   }

//   static Future<bool> askPermission() async {
//     Map<Permission, PermissionStatus> status = await [
//       Permission.storage,
//     ].request();

//     var storageStatus = await Permission.storage.status;
//     return storageStatus == PermissionStatus.granted;
//   }

//   static int getInitialORDValue(String ord) {
//     int ord_value = int.parse(ord);
//     if (ord_value >= 48 && ord_value <= 64)
//       return 48;
//     else if (ord_value > 64 && ord_value <= 91)
//       return 64;
//     else
//       return 2309;
//   }

//   static Future<bool> checkConnectivity() async {
//     // final res = await Connectivity().checkConnectivity();
//     // if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi)
//     return true;
//     // else
//     // return false;
//   }

//   static Future<void> saveImageToGallery(Uint8List imageBytes) async {
//     final result = await ImageGallerySaver.saveImage(imageBytes,
//         quality: 60, name: "hello");
//     print(result);
//   }

//   static showToast(String text) {
//     Fluttertoast.showToast(
//         msg: text,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.grey[100],
//         textColor: Colors.black,
//         fontSize: 16.0);
//   }

//   //#region Region - Show Success Message
//   static showSuccessMessage(String text, BuildContext context) {
//     showTopSnackBar(
//       context,
//       CustomPopups.success(
//         message: text,
//         // icon: null,
//         icon: Icon(Icons.access_alarm),
//       ),
//     );
//     playSound('assets/sounds/effects/success.mp3');
//   }

//   //#endregion

//   //#region Region - Show Info Message
//   static showInfoMessage(String text, BuildContext context) {
//     showTopSnackBar(
//       context,
//       CustomPopups.info(
//         message: text,
//         // icon: null,
//         icon: Icon(Icons.access_alarm),
//       ),
//     );
//   }

//   //#endregion

//   //#region Region - Show Error Message
//   static showErrorMessage(String text, BuildContext context) {
//     showTopSnackBar(
//       context,
//       CustomPopups.error(
//         message: text,
//         // icon: null,
//         icon: Icon(Icons.access_alarm),
//       ),
//     );
//     playSound('assets/sounds/effects/failure.mp3');
//   }

//   //#endregion

//   static String removeUnderScore(String str) {
//     List token = str.split('_');
//     String res = '';
//     for (var tkn in token) res += tkn + ' ';
//     return res;
//   }

//   static Color colorFromHex(String color) {
//     if (color == null) return Colors.blue;
//     color = color.replaceAll("#", "");
//     if (color.length == 8) {
//       return Color(int.parse("0x" + color));
//     } else {
//       return Color(int.parse("0xFF" + color));
//     }
//   }

//   static Color randomColorFromPalette() {
//     int seed = Random().nextInt(kColorPalette.length);
//     return Utility.colorFromHex(kColorPalette[seed]);
//   }

//   static void printWrapped(String text) {
//     final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
//     pattern.allMatches(text).forEach((match) => print(match.group(0)));
//   }
// }
