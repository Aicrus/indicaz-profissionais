import '/backend/supabase/supabase.dart';
import '/componentes/empresa_nao_cadastrada/empresa_nao_cadastrada_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'buscar_empresa_widget.dart' show BuscarEmpresaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
