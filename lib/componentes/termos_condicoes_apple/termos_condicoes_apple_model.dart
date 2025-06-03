import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'termos_condicoes_apple_widget.dart' show TermosCondicoesAppleWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
