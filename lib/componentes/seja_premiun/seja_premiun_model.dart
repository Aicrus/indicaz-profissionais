import '/componentes/plan_pro/plan_pro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'seja_premiun_widget.dart' show SejaPremiunWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SejaPremiunModel extends FlutterFlowModel<SejaPremiunWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PlanPro component.
  late PlanProModel planProModel;

  @override
  void initState(BuildContext context) {
    planProModel = createModel(context, () => PlanProModel());
  }

  @override
  void dispose() {
    planProModel.dispose();
  }
}
