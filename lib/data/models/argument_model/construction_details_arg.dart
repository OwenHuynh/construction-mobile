import 'package:freezed_annotation/freezed_annotation.dart';

part 'construction_details_arg.freezed.dart';
part 'construction_details_arg.g.dart';

@freezed
class ConstructionDetailsArg with _$ConstructionDetailsArg {
  const factory ConstructionDetailsArg({
    @Default('') String siteName,
    @Default('') String date,
    @Default('') String other,
    @Default('') String firstName,
    @Default('') String secondName,
    @Default('') String firstCarName,
    @Default('') String secondCarName,
    @Default('') String firstCar,
    @Default('') String firstCarNumber,
    @Default('') String secondCar,
    @Default('') String secondCarNumber,
  }) = _ConstructionDetailsArg;

  factory ConstructionDetailsArg.fromJson(Map<String, Object?> json) =>
      _$ConstructionDetailsArgFromJson(json);
}
