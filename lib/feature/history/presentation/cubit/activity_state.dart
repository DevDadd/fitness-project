import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'activity_state.g.dart';

@CopyWith()
class ActivityState extends Equatable {
  ActivityState({this.currentWeek = const []});
  List<DateTime> currentWeek;
  @override
  List<Object> get props => [currentWeek];
}
