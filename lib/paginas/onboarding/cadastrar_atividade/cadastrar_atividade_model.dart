import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastrar_atividade_widget.dart' show CadastrarAtividadeWidget;
import 'package:flutter/material.dart';

class CadastrarAtividadeModel
    extends FlutterFlowModel<CadastrarAtividadeWidget> {
  ///  Local state fields for this page.
  /// Setar o que esstiver escrevendo para depois mandar para p componente
  /// aviso3
  String? nomeTexfield;

  List<String> listaNomes = [];
  void addToListaNomes(String item) => listaNomes.add(item);
  void removeFromListaNomes(String item) => listaNomes.remove(item);
  void removeAtIndexFromListaNomes(int index) => listaNomes.removeAt(index);
  void insertAtIndexInListaNomes(int index, String item) =>
      listaNomes.insert(index, item);
  void updateListaNomesAtIndex(int index, Function(String) updateFn) =>
      listaNomes[index] = updateFn(listaNomes[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeAtividade widget.
  FocusNode? nomeAtividadeFocusNode;
  TextEditingController? nomeAtividadeTextController;
  String? Function(BuildContext, String?)? nomeAtividadeTextControllerValidator;
  String? _nomeAtividadeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in nomeAtividade widget.
  List<ActivityRow>? listaAtividades;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<ActivityRow>? atividade;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonLogin widget.
  List<ProhibitedWordsRow>? verif;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in ButtonLogin widget.
  ApiCallResponse? apiResultgnd;

  @override
  void initState(BuildContext context) {
    nomeAtividadeTextControllerValidator =
        _nomeAtividadeTextControllerValidator;
  }

  @override
  void dispose() {
    nomeAtividadeFocusNode?.dispose();
    nomeAtividadeTextController?.dispose();
  }
}
