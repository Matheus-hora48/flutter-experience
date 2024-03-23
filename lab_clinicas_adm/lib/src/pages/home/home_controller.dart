import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class HomeController with MessageStateMixin {
  HomeController({
    required AttendantDeskAssignmentRepository attendantDeskRepository,
  }) : _attendantDeskRepository = attendantDeskRepository;

  final AttendantDeskAssignmentRepository _attendantDeskRepository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result = await _attendantDeskRepository.startService(deskNumber);
    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        showError('Erro ao iniciar o guichê');
      case Right():
        asyncstate.AsyncState.hide();
    }
  }
}
