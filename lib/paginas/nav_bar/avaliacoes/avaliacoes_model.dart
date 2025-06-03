import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/avaliaocao_filter/avaliaocao_filter_widget.dart';
import '/componentes/nav_bar/nav_bar_widget.dart';
import '/componentes/plan_pro/plan_pro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'avaliacoes_widget.dart' show AvaliacoesWidget;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
