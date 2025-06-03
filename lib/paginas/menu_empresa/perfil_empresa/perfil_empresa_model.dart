import '/backend/supabase/supabase.dart';
import '/componentes/atividade_secundaria/atividade_secundaria_widget.dart';
import '/componentes/menu_itens/menu_itens_widget.dart';
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
import 'perfil_empresa_widget.dart' show PerfilEmpresaWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PerfilEmpresaModel extends FlutterFlowModel<PerfilEmpresaWidget> {
  ///  Local state fields for this page.

  int index = 0;

  int categorias = 0;

  bool editar = false;

  bool addAtividade = false;

  int? atividadeEscolhida;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData1 = false;
  FFUploadedFile uploadedLocalFile_uploadData1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData1 = '';

  bool isDataUploading_uploadDataTv7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTv7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataTv7 = '';

  // State field(s) for TextFieldEmpresa widget.
  FocusNode? textFieldEmpresaFocusNode;
  TextEditingController? textFieldEmpresaTextController;
  String? Function(BuildContext, String?)?
      textFieldEmpresaTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in ButtonLogin widget.
  List<CompanyRow>? atualizar;
  // State field(s) for TextFieldApresentacao widget.
  FocusNode? textFieldApresentacaoFocusNode;
  TextEditingController? textFieldApresentacaoTextController;
  String? Function(BuildContext, String?)?
      textFieldApresentacaoTextControllerValidator;
  // State field(s) for atividadePrincipal widget.
  int? atividadePrincipalValue;
  FormFieldController<int>? atividadePrincipalValueController;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel1;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode1;
  TextEditingController? textFieldTelefoneTextController1;
  final textFieldTelefoneMask1 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController1Validator;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode2;
  TextEditingController? textFieldTelefoneTextController2;
  final textFieldTelefoneMask2 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController2Validator;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode3;
  TextEditingController? textFieldTelefoneTextController3;
  final textFieldTelefoneMask3 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController3Validator;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode4;
  TextEditingController? textFieldTelefoneTextController4;
  final textFieldTelefoneMask4 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController4Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel2;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode5;
  TextEditingController? textFieldTelefoneTextController5;
  final textFieldTelefoneMask5 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController5Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel3;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode6;
  TextEditingController? textFieldTelefoneTextController6;
  final textFieldTelefoneMask6 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController6Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel4;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode7;
  TextEditingController? textFieldTelefoneTextController7;
  final textFieldTelefoneMask7 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController7Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel5;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode8;
  TextEditingController? textFieldTelefoneTextController8;
  final textFieldTelefoneMask8 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController8Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel6;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode9;
  TextEditingController? textFieldTelefoneTextController9;
  final textFieldTelefoneMask9 = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController9Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel7;
  // State field(s) for TextFieldTelefone widget.
  FocusNode? textFieldTelefoneFocusNode10;
  TextEditingController? textFieldTelefoneTextController10;
  final textFieldTelefoneMask10 =
      MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      textFieldTelefoneTextController10Validator;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel8;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel9;
  // Stores action output result for [Backend Call - Update Row(s)] action in ButtonLogin widget.
  List<CompanyRow>? endereco;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel10;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel11;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel12;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel13;
  // Model for AtividadeSecundaria component.
  late AtividadeSecundariaModel atividadeSecundariaModel14;

  @override
  void initState(BuildContext context) {
    atividadeSecundariaModel1 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel2 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel3 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel4 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel5 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel6 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel7 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel8 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel9 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel10 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel11 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel12 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel13 =
        createModel(context, () => AtividadeSecundariaModel());
    atividadeSecundariaModel14 =
        createModel(context, () => AtividadeSecundariaModel());
  }

  @override
  void dispose() {
    textFieldEmpresaFocusNode?.dispose();
    textFieldEmpresaTextController?.dispose();

    textFieldApresentacaoFocusNode?.dispose();
    textFieldApresentacaoTextController?.dispose();

    atividadeSecundariaModel1.dispose();
    textFieldTelefoneFocusNode1?.dispose();
    textFieldTelefoneTextController1?.dispose();

    textFieldTelefoneFocusNode2?.dispose();
    textFieldTelefoneTextController2?.dispose();

    textFieldTelefoneFocusNode3?.dispose();
    textFieldTelefoneTextController3?.dispose();

    textFieldTelefoneFocusNode4?.dispose();
    textFieldTelefoneTextController4?.dispose();

    atividadeSecundariaModel2.dispose();
    textFieldTelefoneFocusNode5?.dispose();
    textFieldTelefoneTextController5?.dispose();

    atividadeSecundariaModel3.dispose();
    textFieldTelefoneFocusNode6?.dispose();
    textFieldTelefoneTextController6?.dispose();

    atividadeSecundariaModel4.dispose();
    textFieldTelefoneFocusNode7?.dispose();
    textFieldTelefoneTextController7?.dispose();

    atividadeSecundariaModel5.dispose();
    textFieldTelefoneFocusNode8?.dispose();
    textFieldTelefoneTextController8?.dispose();

    atividadeSecundariaModel6.dispose();
    textFieldTelefoneFocusNode9?.dispose();
    textFieldTelefoneTextController9?.dispose();

    atividadeSecundariaModel7.dispose();
    textFieldTelefoneFocusNode10?.dispose();
    textFieldTelefoneTextController10?.dispose();

    atividadeSecundariaModel8.dispose();
    atividadeSecundariaModel9.dispose();
    atividadeSecundariaModel10.dispose();
    atividadeSecundariaModel11.dispose();
    atividadeSecundariaModel12.dispose();
    atividadeSecundariaModel13.dispose();
    atividadeSecundariaModel14.dispose();
  }
}
