import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dados_empresa_widget.dart' show DadosEmpresaWidget;
import 'package:flutter/material.dart';

class DadosEmpresaModel extends FlutterFlowModel<DadosEmpresaWidget> {
  ///  Local state fields for this page.

  bool abrirPlacePicker = false;

  bool erroImagem = false;

  String? valorEndereco;

  List<ActivityRow> atividadesDropLista = [];
  void addToAtividadesDropLista(ActivityRow item) =>
      atividadesDropLista.add(item);
  void removeFromAtividadesDropLista(ActivityRow item) =>
      atividadesDropLista.remove(item);
  void removeAtIndexFromAtividadesDropLista(int index) =>
      atividadesDropLista.removeAt(index);
  void insertAtIndexInAtividadesDropLista(int index, ActivityRow item) =>
      atividadesDropLista.insert(index, item);
  void updateAtividadesDropListaAtIndex(
          int index, Function(ActivityRow) updateFn) =>
      atividadesDropLista[index] = updateFn(atividadesDropLista[index]);

  bool falltaEndereco = false;

  String? img;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in DadosEmpresa widget.
  List<ActivityRow>? atividadesDrop;
  bool isDataUploading_uploadDataRy7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataRy7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataRy7 = '';

  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
  String? _nomeEmpresaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O nome da empresa é obrigatório';
    }

    return null;
  }

  // State field(s) for atividadePrincipal widget.
  int? atividadePrincipalValue;
  FormFieldController<int>? atividadePrincipalValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<ProhibitedWordsRow>? verif;
  // Stores action output result for [Backend Call - Update Row(s)] action in ButtonLogin widget.
  List<CompanyRow>? idComapany2;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonLogin widget.
  CompanyRow? idCompany;

  @override
  void initState(BuildContext context) {
    nomeEmpresaTextControllerValidator = _nomeEmpresaTextControllerValidator;
  }

  @override
  void dispose() {
    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();
  }
}
