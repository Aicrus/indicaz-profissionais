import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'validar_telefone_widget.dart' show ValidarTelefoneWidget;
import 'package:flutter/material.dart';

class ValidarTelefoneModel extends FlutterFlowModel<ValidarTelefoneWidget> {
  ///  Local state fields for this page.

  int tentativasMax = 2;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - nomeSobrenome] action in PinCode widget.
  dynamic userProfissional2;
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
