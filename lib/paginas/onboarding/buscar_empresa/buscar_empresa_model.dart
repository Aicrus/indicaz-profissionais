import '/backend/supabase/supabase.dart';
import '/componentes/empresa_nao_cadastrada/empresa_nao_cadastrada_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'buscar_empresa_widget.dart' show BuscarEmpresaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BuscarEmpresaModel extends FlutterFlowModel<BuscarEmpresaWidget> {
  ///  Local state fields for this page.

  String? numeroProfi;

  bool mostrar = false;

  bool loading = false;

  String? remove55;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode;
  TextEditingController? textFieldTelefoneTextController;
  final textFieldTelefoneMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<UserProfissionaisRow>? userProfisisonal;
  // Stores action output result for [Backend Call - Update Row(s)] action in ButtonLogin widget.
  List<CompanyRow>? company;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<ActivityRow>? atividadeCompany;
  // Model for empresaNaoCadastrada component.
  late EmpresaNaoCadastradaModel empresaNaoCadastradaModel;

  @override
  void initState(BuildContext context) {
    empresaNaoCadastradaModel =
        createModel(context, () => EmpresaNaoCadastradaModel());
  }

  @override
  void dispose() {
    textFieldTelefoneFocusNode?.dispose();
    textFieldTelefoneTextController?.dispose();

    empresaNaoCadastradaModel.dispose();
  }
}
