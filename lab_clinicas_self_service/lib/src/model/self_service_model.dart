import 'package:flutter/material.dart';
import 'package:lab_clinicas_self_service/src/model/patients_model.dart';

class SelfServiceModel {
  SelfServiceModel({this.name, this.lastName, this.patient});

  final String? name;
  final String? lastName;
  final PatientsModel? patient;

  SelfServiceModel clear() {
    return copyWith(
      name: () => null,
      lastName: () => null,
      patient: () => null,
    );
  }

  SelfServiceModel copyWith(
      {ValueGetter<String?>? name,
      ValueGetter<String?>? lastName,
      ValueGetter<PatientsModel?>? patient}) {
    return SelfServiceModel(
        name: name != null ? name() : this.name,
        lastName: lastName != null ? lastName() : this.lastName,
        patient: patient != null ? patient() : this.patient);
  }
}
