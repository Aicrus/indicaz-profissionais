import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/logins_google_apple/logins_google_apple_widget.dart';
import '/componentes/termos_condicoes_email/termos_condicoes_email_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'cadastro_login_widget.dart' show CadastroLoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroLoginModel extends FlutterFlowModel<CadastroLoginWidget> {
  ///  Local state fields for this page.

  bool passChek = true;

  int tipoAutenticacao = 0;

  bool acietarTermos = false;

  int? googleApple;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (val.length < 6) {
      return 'Mínimo 6 caracteres';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in ButtonLogin widget.
  bool? formulario4;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<UserProfissionaisRow>? profissional01;
  // Stores action output result for [Validate Form] action in ButtonLogin widget.
  bool? formulario3;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<UserProfissionaisRow>? verificacaoUseProfissional;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<UserResidentRow>? verificacaoUserMorador;
  // Model for loginsGoogleApple component.
  late LoginsGoogleAppleModel loginsGoogleAppleModel;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    loginsGoogleAppleModel =
        createModel(context, () => LoginsGoogleAppleModel());
  }

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    loginsGoogleAppleModel.dispose();
  }
}
