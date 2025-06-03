import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'termos_condicoes_google_widget.dart' show TermosCondicoesGoogleWidget;
import 'package:flutter/material.dart';

class TermosCondicoesGoogleModel
    extends FlutterFlowModel<TermosCondicoesGoogleWidget> {
  ///  Local state fields for this component.

  bool acietarTermos = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Custom Action - getUser] action in Button widget.
  UserInfoStruct? profissionalUser;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserResidentRow>? verificacaoUserMorador;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfissionaisRow>? verificacaoUseProfissional;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
