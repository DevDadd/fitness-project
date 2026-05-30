import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessai/feature/AI/data/model/detect_model.dart';
import 'package:fitnessai/feature/AI/data/model/status_model.dart';
import 'package:image_picker/image_picker.dart';

part 'detect_state.g.dart';

@CopyWith()
class DetectState extends Equatable {
  DetectState({this.video, this.uploadResult, this.statusResult});
  XFile? video;
  DetectModel? uploadResult;
  StatusModel? statusResult;
  @override
  List<Object?> get props => [video, uploadResult, statusResult];
}
