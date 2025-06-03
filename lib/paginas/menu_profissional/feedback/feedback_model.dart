import '/componentes/sem_resultados/sem_resultados_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:flutter/material.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for semResultados component.
  late SemResultadosModel semResultadosModel;

  @override
  void initState(BuildContext context) {
    semResultadosModel = createModel(context, () => SemResultadosModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    semResultadosModel.dispose();
  }
}
