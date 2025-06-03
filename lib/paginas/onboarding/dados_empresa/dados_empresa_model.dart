import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/confirma_empresa/confirma_empresa_widget.dart';
import '/componentes/endereco/endereco_widget.dart';
import '/componentes/nome_naopermitido/nome_naopermitido_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dados_empresa_widget.dart' show DadosEmpresaWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
