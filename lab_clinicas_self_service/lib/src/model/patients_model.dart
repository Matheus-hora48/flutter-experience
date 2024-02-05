import 'package:json_annotation/json_annotation.dart';

part 'patients_model.g.dart';

@JsonSerializable()
class PatientsModel {
  final String id;
  final String name,
  final String email,
  @JsonKey(name: 'phone_number')
  final string phoneNumber;
  final String document,
  

  factory PatientsModel.fromJson(Map<String, dynamic> json) => _$PatientsModelFromJson(json);

  Map<String,dynamic> toJson() => _$PatientsModelToJson(this);
}