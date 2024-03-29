import 'package:json_annotation/json_annotation.dart';
import 'package:lab_clinicas_self_service/src/model/patient_address_model.dart';

part 'patients_model.g.dart';

@JsonSerializable()
class PatientsModel {
  final String id;
  final String name;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String document;
  final PatientAddressModel address;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;
  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;

  PatientsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.document,
    required this.address,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  factory PatientsModel.fromJson(Map<String, dynamic> json) =>
      _$PatientsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientsModelToJson(this);

  PatientsModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? document,
    PatientAddressModel? address,
    String? guardian,
    String? guardianIdentificationNumber,
  }) {
    return PatientsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      document: document ?? this.document,
      address: address ?? this.address,
      guardian: guardian ?? this.guardian,
      guardianIdentificationNumber: guardianIdentificationNumber ?? this.guardianIdentificationNumber,
    );
  }
}
