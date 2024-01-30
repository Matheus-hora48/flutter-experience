import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final class Messages {
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  static void showSucess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }
}

mixin MessageStateMixin {
  final Signal<String?> _erroMessage = signal(null);
  String? get erroMessage => _erroMessage();

  final Signal<String?> _infoMessage = signal(null);
  String? get infoMessage => _erroMessage();

  final Signal<String?> _successMessage = signal(null);
  String? get successMessage => _erroMessage();

  void clearError() => _erroMessage.value = null;
  void clearInfo() => _erroMessage.value = null;
  void clearSuccess() => _erroMessage.value = null;

  void showError(String message) {
    untracked(() => clearError());
    _erroMessage.value = message;
  }

  void showInfo(String message) {
    untracked(() => clearInfo());
    _infoMessage.value = message;
  }

  void showSuccess(String message) {
    untracked(() => clearSuccess());
    _successMessage.value = message;
  }

  void clearAllMessages() {
    untracked(() {
      clearError();
      clearInfo();
      clearSuccess();
    });
  }
}

mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  void messageListener(MessageStateMixin state) {
    effect(() {
      switch (state) {
        case MessageStateMixin(:final erroMessage?):
          Messages.showError(erroMessage, context);
        case MessageStateMixin(:final infoMessage?):
          Messages.showInfo(infoMessage, context);
        case MessageStateMixin(:final successMessage?):
          Messages.showSucess(successMessage, context);
      }
    });
  }
}
