import '/componentes/como_funciona2/como_funciona2_widget.dart';
import '/componentes/falar_com_suporte/falar_com_suporte_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'ajuda_widget.dart' show AjudaWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AjudaModel extends FlutterFlowModel<AjudaWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // Model for comoFunciona2 component.
  late ComoFunciona2Model comoFunciona2Model;
  // Model for FalarComSuporte component.
  late FalarComSuporteModel falarComSuporteModel;

  @override
  void initState(BuildContext context) {
    comoFunciona2Model = createModel(context, () => ComoFunciona2Model());
    falarComSuporteModel = createModel(context, () => FalarComSuporteModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    expandableExpandableController6.dispose();
    comoFunciona2Model.dispose();
    falarComSuporteModel.dispose();
  }
}
