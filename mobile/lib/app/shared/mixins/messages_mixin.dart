import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class MessagesMixin {
  final scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  showError({
    @required String message,
    BuildContext context,
    GlobalKey<ScaffoldState> key,
  }) => _showSnackBar(
    context: context,
    color: Colors.red, 
    message: message, 
    key: key
  );

  showSuccess({
    @required String message,
    BuildContext context,
    GlobalKey<ScaffoldState> key,
  }) => _showSnackBar(
    context: context,
    color: Theme.of(context).primaryColor,
    message: message, 
    key: key
  );

  void _showSnackBar(
    {
      String message,
      BuildContext context,
      GlobalKey<ScaffoldState> key,
      Color color
    }
  ) {
    final snackbar = SnackBar(
      backgroundColor: color,
      content: Text(message)
    );

    if(key != null) {
      key.currentState.showSnackBar(snackbar);
    } else {
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }
}