import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'termos_condicoes_apple_widget.dart' show TermosCondicoesAppleWidget;
import 'package:flutter/material.dart';

class TermosCondicoesAppleModel
    extends FlutterFlowModel<TermosCondicoesAppleWidget> {
  ///  Local state fields for this component.

  bool acietarTermos = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Custom Action - getUser] action in Button widget.
  UserInfoStruct? profissionalUser2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserResidentRow>? verificacaoUserMorador2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserProfissionaisRow>? verificacaoUseProfissional2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
