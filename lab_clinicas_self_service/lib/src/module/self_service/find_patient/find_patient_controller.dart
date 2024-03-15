// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patients_model.dart';
import 'package:lab_clinicas_self_service/src/repositories/patients/patients_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({
    required PatientsRepository patientsRepository,
  }) : _patientsRepository = patientsRepository;

  final PatientsRepository _patientsRepository;
  get _patientNotFound => ValueSignal<bool?>(null);
  final _patient = ValueSignal<PatientsModel?>(null);

  bool? get patientNotFound => _patientNotFound();
  PatientsModel? get patient => _patient();

  Future<void> findPatientyByDocument(String document) async {
    final patientResult =
        await _patientsRepository.findPatientByDocument(document);

    bool patientNotFound;
    PatientsModel? patient;

    switch (patientResult) {
      case Right(value: PatientsModel model?):
        patientNotFound = false;
        patient = model;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left():
        patientNotFound = true;
        showError('Erro ao buscar paciente');
        return;
    }

    batch(() {
      _patient.forceUpdate(patient);
      _patientNotFound.forceUpdate(patientNotFound);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.value = null;
      _patientNotFound.forceUpdate(null);
    });
  }
}
