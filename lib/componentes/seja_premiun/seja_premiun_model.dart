import '/componentes/plan_pro/plan_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seja_premiun_widget.dart' show SejaPremiunWidget;
import 'package:flutter/material.dart';

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
