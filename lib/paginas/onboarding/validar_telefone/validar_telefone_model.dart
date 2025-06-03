import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/erro/erro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'validar_telefone_widget.dart' show ValidarTelefoneWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ValidarTelefoneModel extends FlutterFlowModel<ValidarTelefoneWidget> {
  ///  Local state fields for this page.

  int tentativasMax = 2;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - nomeSobrenome] action in PinCode widget.
  dynamic? userProfissional2;
  // Stores action output result for [Backend Call - Update Row(s)] action in PinCode widget.
  List<UserProfissionaisRow>? userProID;
  // Stores action output result for [Backend Call - Update Row(s)] action in PinCode widget.
  List<UserProfissionaisRow>? userProID2;
  // Stores action output result for [Backend Call - API (Twilio WhatsApp Code Producao)] action in Text widget.
  ApiCallResponse? numero2;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
