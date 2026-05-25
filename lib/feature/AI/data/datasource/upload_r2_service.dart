import 'dart:io';

import 'package:aws_s3_api/s3-2006-03-01.dart';
import 'package:path/path.dart' as path;

class UploadR2Service {
  static const _accountId = '377cd1b9f45bc4ba22459f510676b999';
  static const _accessKeyId = '1141be8dc550869018021ecd24f8e7fd';
  static const _secretAccessKey =
      '48f4548c7e7210ce4efb207fc3df6c41a029a1dc5d1c3472a372b358308bb28c';
  static const _bucketName = 'fitness-video';
  static const _publicUrl =
      'https://pub-f72bda466e6f4b24b0439aad1baed19b.r2.dev';

  late final S3 _s3;

  UploadR2Service() {
    _s3 = S3(
      region: 'auto',
      endpointUrl: 'https://$_accountId.r2.cloudflarestorage.com',
      credentials: AwsClientCredentials(
        accessKey: _accessKeyId,
        secretKey: _secretAccessKey,
      ),
    );
  }

  Future<String> uploadFile(File file) async {
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${path.basename(file.path)}';

    await _s3.putObject(
      bucket: _bucketName,
      key: fileName,
      body: await file.readAsBytes(),
      contentType: 'video/mp4',
    );

    return '$_publicUrl/$fileName';
  }
}
