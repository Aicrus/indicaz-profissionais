import '/backend/supabase/supabase.dart';
import '/componentes/nav_bar/nav_bar_widget.dart';
import '/componentes/plan_pro/plan_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'avaliacoes_widget.dart' show AvaliacoesWidget;
import 'package:flutter/material.dart';

class AvaliacoesModel extends FlutterFlowModel<AvaliacoesWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Avaliacoes widget.
  List<UserProfissionaisRow>? userProfissional;
  // Stores action output result for [Backend Call - Query Rows] action in Avaliacoes widget.
  List<CompanyRow>? company;
  // Stores action output result for [Backend Call - Query Rows] action in Avaliacoes widget.
  List<ActivityRow>? atividade;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for PlanPro component.
  late PlanProModel planProModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    planProModel = createModel(context, () => PlanProModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    planProModel.dispose();
  }
}
