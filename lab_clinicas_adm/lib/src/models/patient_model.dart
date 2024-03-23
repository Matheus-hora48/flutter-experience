import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
    PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.document,
    required this.address,
    required this.guardian,
    required this.guardianIndentificationNumber
  });

  String id;
  String name;
  String email;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String document;
  PatientModel address;
  @JsonKey(defaultValue: '')
  String guardian;
  @JsonKey(name: 'guardian_indentification_number', defaultValue: '')
  String guardianIndentificationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
