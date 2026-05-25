import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'detect_state.g.dart';

@CopyWith()
class DetectState extends Equatable {
  DetectState({this.video});
  XFile? video;
  @override
  List<Object?> get props => [video];
}
