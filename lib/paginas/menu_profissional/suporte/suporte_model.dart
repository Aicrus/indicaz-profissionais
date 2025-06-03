import '/flutter_flow/flutter_flow_util.dart';
import 'suporte_widget.dart' show SuporteWidget;
import 'package:flutter/material.dart';

class SuporteModel extends FlutterFlowModel<SuporteWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
