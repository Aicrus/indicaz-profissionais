import '/auth/supabase_auth/auth_util.dart';
import '/componentes/erro/erro_widget.dart';
import '/componentes/sucesso/sucesso_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'nova_senha_widget.dart' show NovaSenhaWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
