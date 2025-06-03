import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dados_pessoais_widget.dart' show DadosPessoaisWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosPessoaisModel extends FlutterFlowModel<DadosPessoaisWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData0w8 = false;
  FFUploadedFile uploadedLocalFile_uploadData0w8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData0w8 = '';

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  String? _nomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneTextController;
  final telefoneMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? telefoneTextControllerValidator;
  String? _telefoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 11) {
      return 'Formato inválido';
    }

    return null;
  }

  // Stores action output result for [Custom Action - nomeSobrenome] action in ButtonLogin widget.
  dynamic nomeSobrenome;
  // Stores action output result for [Backend Call - API (Twilio WhatsApp Code Producao)] action in ButtonLogin widget.
  ApiCallResponse? numero;

  @override
  void initState(BuildContext context) {
    nomeTextControllerValidator = _nomeTextControllerValidator;
    telefoneTextControllerValidator = _telefoneTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneTextController?.dispose();
  }
}
