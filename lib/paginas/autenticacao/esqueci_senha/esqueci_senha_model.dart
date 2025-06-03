import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'esqueci_senha_widget.dart' show EsqueciSenhaWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EsqueciSenhaModel extends FlutterFlowModel<EsqueciSenhaWidget> {
  ///  Local state fields for this page.

  bool passChek = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailFied widget.
  FocusNode? emailFiedFocusNode;
  TextEditingController? emailFiedTextController;
  String? Function(BuildContext, String?)? emailFiedTextControllerValidator;
  String? _emailFiedTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailFiedTextControllerValidator = _emailFiedTextControllerValidator;
  }

  @override
  void dispose() {
    emailFiedFocusNode?.dispose();
    emailFiedTextController?.dispose();
  }
}
