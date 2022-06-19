import 'package:flutter/material.dart';

@optionalTypeArgs
mixin ServiceErrorTransactionMixin<T extends StatefulWidget> on State<T> {
  void $showErrorDialog(String title, String message) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Text(message),
    );
  }

  void $showErrorSnackbarFromInputException(String message) {
    final String details = message;

    $showErrorDialog(
      message,
      details.replaceFirst(RegExp(r'\w+\:\s*'), ''),
    );
  }
}
