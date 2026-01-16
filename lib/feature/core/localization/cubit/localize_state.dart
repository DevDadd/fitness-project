import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'localize_state.g.dart';

@CopyWith()
class LocalizeState extends Equatable {
  LocalizeState({this.currentLanguage = "vi"});
  String? currentLanguage;
  @override
  List<Object?> get props => [currentLanguage];
}

