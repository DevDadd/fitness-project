import 'package:permission_handler/permission_handler.dart';

Future<void> requestActivityPermission() async {
  final status = await Permission.activityRecognition.request();

  if (status.isDenied) {
    print('Activity recognition denied');
  }

  if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}
