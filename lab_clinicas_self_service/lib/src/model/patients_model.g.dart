// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsModel _$PatientsModelFromJson(Map<String, dynamic> json) =>
    PatientsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      document: json['document'] as String,
      address:
          PatientAddressModel.fromJson(json['address'] as Map<String, dynamic>),
      guardian: json['guardian'] as String? ?? '',
      guardianIdentificationNumber:
          json['guardian_identification_number'] as String? ?? '',
    );

Map<String, dynamic> _$PatientsModelToJson(PatientsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'document': instance.document,
      'address': instance.address,
      'guardian': instance.guardian,
      'guardian_identification_number': instance.guardianIdentificationNumber,
    };
