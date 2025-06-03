import '/backend/supabase/supabase.dart';
import '/componentes/nav_bar/nav_bar_widget.dart';
import '/componentes/plan_pro/plan_pro_widget.dart';
import '/componentes/pro/pro_widget.dart';
import '/componentes/seja_premiun/seja_premiun_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_painel_geral_widget.dart' show HomePainelGeralWidget;
import 'package:flutter/material.dart';

class HomePainelGeralModel extends FlutterFlowModel<HomePainelGeralWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePainelGeral widget.
  List<UserProfissionaisRow>? userProfissional;
  // Stores action output result for [Backend Call - Query Rows] action in HomePainelGeral widget.
  List<CompanyRow>? company;
  // Stores action output result for [Backend Call - Query Rows] action in HomePainelGeral widget.
  List<ActivityRow>? atividade;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for SejaPremiun component.
  late SejaPremiunModel sejaPremiunModel1;
  // Model for SejaPremiun component.
  late SejaPremiunModel sejaPremiunModel2;
  // Model for SejaPremiun component.
  late SejaPremiunModel sejaPremiunModel3;
  // Model for PRO component.
  late ProModel proModel1;
  // Model for PRO component.
  late ProModel proModel2;
  // Model for PRO component.
  late ProModel proModel3;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for PlanPro component.
  late PlanProModel planProModel;

  @override
  void initState(BuildContext context) {
    sejaPremiunModel1 = createModel(context, () => SejaPremiunModel());
    sejaPremiunModel2 = createModel(context, () => SejaPremiunModel());
    sejaPremiunModel3 = createModel(context, () => SejaPremiunModel());
    proModel1 = createModel(context, () => ProModel());
    proModel2 = createModel(context, () => ProModel());
    proModel3 = createModel(context, () => ProModel());
    navBarModel = createModel(context, () => NavBarModel());
    planProModel = createModel(context, () => PlanProModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    sejaPremiunModel1.dispose();
    sejaPremiunModel2.dispose();
    sejaPremiunModel3.dispose();
    proModel1.dispose();
    proModel2.dispose();
    proModel3.dispose();
    navBarModel.dispose();
    planProModel.dispose();
  }
}
