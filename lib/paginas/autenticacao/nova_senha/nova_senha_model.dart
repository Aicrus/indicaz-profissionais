import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nova_senha_widget.dart' show NovaSenhaWidget;
import 'package:flutter/material.dart';

class NovaSenhaModel extends FlutterFlowModel<NovaSenhaWidget> {
  ///  Local state fields for this page.

  bool passChek = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for passwordFieldNew widget.
  FocusNode? passwordFieldNewFocusNode;
  TextEditingController? passwordFieldNewTextController;
  late bool passwordFieldNewVisibility;
  String? Function(BuildContext, String?)?
      passwordFieldNewTextControllerValidator;
  String? _passwordFieldNewTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Adicione uma nova senha';
    }

    if (val.length < 6) {
      return 'Minimo de 6 caractéres';
    }

    return null;
  }

  // State field(s) for passwordFieldNewConfirm widget.
  FocusNode? passwordFieldNewConfirmFocusNode;
  TextEditingController? passwordFieldNewConfirmTextController;
  late bool passwordFieldNewConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordFieldNewConfirmTextControllerValidator;
  String? _passwordFieldNewConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Adicione a confirmação de senha';
    }

    if (val.length < 6) {
      return 'Minimo de 6 caractéres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    passwordFieldNewVisibility = false;
    passwordFieldNewTextControllerValidator =
        _passwordFieldNewTextControllerValidator;
    passwordFieldNewConfirmVisibility = false;
    passwordFieldNewConfirmTextControllerValidator =
        _passwordFieldNewConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    passwordFieldNewFocusNode?.dispose();
    passwordFieldNewTextController?.dispose();

    passwordFieldNewConfirmFocusNode?.dispose();
    passwordFieldNewConfirmTextController?.dispose();
  }
}
