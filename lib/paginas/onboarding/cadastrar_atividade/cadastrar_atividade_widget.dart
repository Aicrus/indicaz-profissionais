import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/atividade_aprovada/atividade_aprovada_widget.dart';
import '/componentes/atividade_existe/atividade_existe_widget.dart';
import '/componentes/atividade_nao_permitida/atividade_nao_permitida_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastrar_atividade_model.dart';
export 'cadastrar_atividade_model.dart';

class CadastrarAtividadeWidget extends StatefulWidget {
  const CadastrarAtividadeWidget({
    super.key,
    this.company,
    this.criar,
    String? phone,
    this.atividade,
    this.isUser,
    this.endereco,
    this.nomeEmpresa,
    this.img,
    bool? perfilEmpresa,
  })  : this.phone = phone ?? '',
        this.perfilEmpresa = perfilEmpresa ?? false;

  final CompanyRow? company;
  final bool? criar;
  final String phone;
  final ActivityRow? atividade;
  final int? isUser;
  final String? endereco;
  final String? nomeEmpresa;
  final String? img;
  final bool perfilEmpresa;

  static String routeName = 'CadastrarAtividade';
  static String routePath = '/cadastrarAtividade';

  @override
  State<CadastrarAtividadeWidget> createState() =>
      _CadastrarAtividadeWidgetState();
}

class _CadastrarAtividadeWidgetState extends State<CadastrarAtividadeWidget> {
  late CadastrarAtividadeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastrarAtividadeModel());

    _model.nomeAtividadeTextController ??= TextEditingController();
    _model.nomeAtividadeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 65.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget!.perfilEmpresa) {
                          context.pushNamed(
                            PerfilEmpresaWidget.routeName,
                            queryParameters: {
                              'company': serializeParam(
                                widget!.company,
                                ParamType.SupabaseRow,
                              ),
                              'atividade': serializeParam(
                                widget!.atividade,
                                ParamType.SupabaseRow,
                              ),
                              'categoria': serializeParam(
                                3,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          context.pushNamed(
                            DadosEmpresaWidget.routeName,
                            queryParameters: {
                              'company': serializeParam(
                                widget!.company,
                                ParamType.SupabaseRow,
                              ),
                              'criar': serializeParam(
                                widget!.criar,
                                ParamType.bool,
                              ),
                              'phone': serializeParam(
                                widget!.phone,
                                ParamType.String,
                              ),
                              'atividade': serializeParam(
                                widget!.atividade,
                                ParamType.SupabaseRow,
                              ),
                              'idUser': serializeParam(
                                widget!.isUser,
                                ParamType.int,
                              ),
                              'endereco': serializeParam(
                                widget!.endereco,
                                ParamType.String,
                              ),
                              'nomeEmpresa': serializeParam(
                                widget!.nomeEmpresa,
                                ParamType.String,
                              ),
                              'img': serializeParam(
                                widget!.img,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        }
                      },
                      child: Icon(
                        Icons.chevron_left_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                    ),
                    Text(
                      'Cadastrar atividade',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 19.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                      child: Text(
                        'Informe a atividade que deseja cadastrar.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          children: [
                            TextFormField(
                              controller: _model.nomeAtividadeTextController,
                              focusNode: _model.nomeAtividadeFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.nomeAtividadeTextController',
                                Duration(milliseconds: 20),
                                () async {
                                  _model.listaAtividades =
                                      await ActivityTable().queryRows(
                                    queryFn: (q) => q.ilike(
                                      'name',
                                      '%${_model.nomeAtividadeTextController.text}%',
                                    ),
                                  );
                                  _model.listaNomes = _model.listaAtividades!
                                      .map((e) => e.name)
                                      .withoutNulls
                                      .toList()
                                      .cast<String>();
                                  safeSetState(() {});
                                  if (_model.nomeAtividadeTextController.text ==
                                          null ||
                                      _model.nomeAtividadeTextController.text ==
                                          '') {
                                    _model.listaNomes = [];
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Atividade',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                hintText: FFAppState().nomeTexfield != null &&
                                        FFAppState().nomeTexfield != ''
                                    ? FFAppState().escolhaAtividadeLista
                                    : FFAppState().escolhaAtividadeLista,
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFFFBFBF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              validator: _model
                                  .nomeAtividadeTextControllerValidator
                                  .asValidator(context),
                            ),
                            if (_model.nomeAtividadeTextController.text !=
                                    null &&
                                _model.nomeAtividadeTextController.text != '')
                              Align(
                                alignment: AlignmentDirectional(0.94, -0.19),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    safeSetState(() {
                                      _model.nomeAtividadeTextController
                                          ?.clear();
                                    });
                                    _model.listaNomes = [];
                                    safeSetState(() {});
                                    FFAppState().escolhaAtividadeLista = '';
                                    FFAppState().update(() {});
                                  },
                                  child: Icon(
                                    Icons.clear_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.nomeAtividadeTextController.text != null &&
                        _model.nomeAtividadeTextController.text != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Text(
                          'Atividades semelhantes já cadastradas:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 400.0,
                            constraints: BoxConstraints(
                              maxHeight: 397.6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (_model.nomeAtividadeTextController.text !=
                                          null &&
                                      _model.nomeAtividadeTextController.text !=
                                          '')
                                    Builder(
                                      builder: (context) {
                                        final listAtividades = _model.listaNomes
                                            .map((e) => e)
                                            .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listAtividades.length,
                                          itemBuilder:
                                              (context, listAtividadesIndex) {
                                            final listAtividadesItem =
                                                listAtividades[
                                                    listAtividadesIndex];
                                            return Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              AtividadeExisteWidget(
                                                            detalhes: _model
                                                                .nomeAtividadeTextController
                                                                .text,
                                                            company:
                                                                widget!.company,
                                                            criar:
                                                                widget!.criar,
                                                            idUser:
                                                                widget!.isUser,
                                                            phone:
                                                                widget!.phone,
                                                            atividade: _model
                                                                .listaAtividades
                                                                ?.firstOrNull,
                                                            endereco: widget!
                                                                .endereco,
                                                            nomeEmpresa: widget!
                                                                .nomeEmpresa,
                                                            img: widget!.img,
                                                            perfilEmpresa: widget!
                                                                .perfilEmpresa,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        functions.textoIgual(
                                                                _model
                                                                    .nomeAtividadeTextController
                                                                    .text,
                                                                listAtividadesItem)
                                                            ? Color(0xFFF2F2F2)
                                                            : Colors
                                                                .transparent,
                                                        Colors.transparent,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      15.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listAtividadesItem,
                                                                    'Atividades',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.0,
                                                          thickness: 1.5,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  if (_model.nomeAtividadeTextController.text ==
                                          null ||
                                      _model.nomeAtividadeTextController.text ==
                                          '')
                                    FutureBuilder<List<ActivityRow>>(
                                      future: ActivityTable().queryRows(
                                        queryFn: (q) => q,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ActivityRow>
                                            listViewActivityRowList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewActivityRowList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewActivityRow =
                                                listViewActivityRowList[
                                                    listViewIndex];
                                            return Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              AtividadeExisteWidget(
                                                            detalhes: _model
                                                                .nomeAtividadeTextController
                                                                .text,
                                                            company:
                                                                widget!.company,
                                                            criar:
                                                                widget!.criar,
                                                            idUser:
                                                                widget!.isUser,
                                                            phone:
                                                                widget!.phone,
                                                            atividade:
                                                                listViewActivityRow,
                                                            endereco: widget!
                                                                .endereco,
                                                            nomeEmpresa: widget!
                                                                .nomeEmpresa,
                                                            img: widget!.img,
                                                            perfilEmpresa: widget!
                                                                .perfilEmpresa,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        functions.textoIgual(
                                                                _model
                                                                    .nomeAtividadeTextController
                                                                    .text,
                                                                listViewActivityRow
                                                                    .name!)
                                                            ? Color(0xFFF2F2F2)
                                                            : Colors
                                                                .transparent,
                                                        Colors.transparent,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      15.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewActivityRow
                                                                        .name,
                                                                    'Atividade',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.0,
                                                          thickness: 1.5,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            _model.atividade = await ActivityTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'name',
                                _model.nomeAtividadeTextController.text,
                              ),
                            );
                            if ((_model.atividade != null &&
                                    (_model.atividade)!.isNotEmpty) ==
                                true) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: AtividadeExisteWidget(
                                        detalhes: _model
                                            .nomeAtividadeTextController.text,
                                        company: widget!.company,
                                        criar: widget!.criar,
                                        idUser: widget!.isUser,
                                        phone: widget!.phone,
                                        atividade:
                                            _model.listaAtividades?.firstOrNull,
                                        endereco: widget!.endereco,
                                        nomeEmpresa: widget!.nomeEmpresa,
                                        img: widget!.img,
                                        perfilEmpresa: widget!.perfilEmpresa,
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              _model.verif =
                                  await ProhibitedWordsTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'name',
                                  _model.nomeAtividadeTextController.text,
                                ),
                              );
                              if (functions.compararMinuscula(
                                  _model.verif?.firstOrNull?.name,
                                  _model.nomeAtividadeTextController.text)) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Container(
                                          width: 290.0,
                                          child: AtividadeNaoPermitidaWidget(
                                            detalhes: _model
                                                .nomeAtividadeTextController
                                                .text,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                _model.apiResultgnd = await OpenAIAPIGroup
                                    .createChatCompletionCall
                                    .call(
                                  activityName:
                                      _model.nomeAtividadeTextController.text,
                                );

                                if (functions.getGptResponse(
                                        (_model.apiResultgnd?.jsonBody ??
                                            '')) ==
                                    'APPROVED') {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: AtividadeAprovadaWidget(
                                            detalhes: _model
                                                .nomeAtividadeTextController
                                                .text,
                                            company: widget!.company,
                                            criar: widget!.criar,
                                            idUser: widget!.isUser,
                                            phone: widget!.phone,
                                            atividade:
                                                _model.atividade?.firstOrNull,
                                            nomeEmpresa: widget!.nomeEmpresa,
                                            endereco: widget!.endereco,
                                            img: widget!.img,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  await ProhibitedWordsTable().insert({
                                    'name':
                                        _model.nomeAtividadeTextController.text,
                                    'gpt_created': true,
                                  });
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: AtividadeNaoPermitidaWidget(),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            }

                            safeSetState(() {});
                          },
                          text: 'Validar novo cadastro de atividade',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
