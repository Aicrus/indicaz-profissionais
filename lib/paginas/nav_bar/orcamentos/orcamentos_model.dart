import '/backend/supabase/supabase.dart';
import '/componentes/nav_bar/nav_bar_widget.dart';
import '/componentes/plan_pro/plan_pro_widget.dart';
import '/componentes/pro/pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'orcamentos_widget.dart' show OrcamentosWidget;
import 'package:flutter/material.dart';

class OrcamentosModel extends FlutterFlowModel<OrcamentosWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Orcamentos widget.
  List<UserProfissionaisRow>? userProfissional;
  // Stores action output result for [Backend Call - Query Rows] action in Orcamentos widget.
  List<CompanyRow>? company;
  // Stores action output result for [Backend Call - Query Rows] action in Orcamentos widget.
  List<ActivityRow>? atividade;
  // Model for PRO component.
  late ProModel proModel;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for PlanPro component.
  late PlanProModel planProModel;

  @override
  void initState(BuildContext context) {
    proModel = createModel(context, () => ProModel());
    navBarModel = createModel(context, () => NavBarModel());
    planProModel = createModel(context, () => PlanProModel());
  }

  @override
  void dispose() {
    proModel.dispose();
    navBarModel.dispose();
    planProModel.dispose();
  }
}
