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
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dados_empresa_model.dart';
export 'dados_empresa_model.dart';

class DadosEmpresaWidget extends StatefulWidget {
  const DadosEmpresaWidget({
    super.key,
    this.company,
    this.criar,
    this.phone,
    this.atividade,
    this.idUser,
    this.endereco,
    this.nomeEmpresa,
    String? img,
  }) : this.img = img ?? '';

  final CompanyRow? company;
  final bool? criar;
  final String? phone;
  final ActivityRow? atividade;
  final int? idUser;
  final String? endereco;
  final String? nomeEmpresa;
  final String img;

  static String routeName = 'DadosEmpresa';
  static String routePath = '/dadosEmpresa';

  @override
  State<DadosEmpresaWidget> createState() => _DadosEmpresaWidgetState();
}

class _DadosEmpresaWidgetState extends State<DadosEmpresaWidget> {
  late DadosEmpresaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DadosEmpresaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.img = widget.img != ''
          ? widget.img
          : widget.company?.photo;
      safeSetState(() {});
      _model.atividadesDrop = await ActivityTable().queryRows(
        queryFn: (q) => q,
      );
      _model.atividadesDropLista =
          _model.atividadesDrop!.toList().cast<ActivityRow>();
      safeSetState(() {});
      if (widget.nomeEmpresa != null && widget.nomeEmpresa != '') {
        safeSetState(() {
          _model.nomeEmpresaTextController?.text = widget.nomeEmpresa!;
        });
      } else {
        safeSetState(() {
          _model.nomeEmpresaTextController?.text = widget.company!.name!;
        });
      }
    });

    _model.nomeEmpresaTextController ??=
        TextEditingController(text: widget.company?.name);
    _model.nomeEmpresaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 65.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Dados da Empresa',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                          height: 500.0,
                                          width: 385.0,
                                          child: EnderecoWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.info_outlined,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 14.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Text(
                        'Informações básicas do perfil da sua empresa.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      storageFolderPath: 'usersProfissional',
                                      imageQuality: 90,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadDataRy7 =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls =
                                            await uploadSupabaseStorageFiles(
                                          bucketName: 'imagensprofissional',
                                          selectedFiles: selectedMedia,
                                        );
                                      } finally {
                                        _model.isDataUploading_uploadDataRy7 =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_uploadDataRy7 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl_uploadDataRy7 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }

                                    _model.img =
                                        _model.uploadedFileUrl_uploadDataRy7;
                                    _model.erroImagem = false;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDFEAFA),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          () {
                                            if (widget.criar == false) {
                                              return valueOrDefault<String>(
                                                widget.company?.photo,
                                                '-',
                                              );
                                            } else if ((widget.img != '') &&
                                                (_model.uploadedFileUrl_uploadDataRy7 ==
                                                        '')) {
                                              return widget.img;
                                            } else {
                                              return _model
                                                  .uploadedFileUrl_uploadDataRy7;
                                            }
                                          }(),
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Visibility(
                                      visible: _model.img == null ||
                                          _model.img == '',
                                      child: Icon(
                                        FFIcons.kidentificacaoSVGConvertido,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 60.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_model.erroImagem)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'A imagem é obrrigatória',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            if ((_model.img == null || _model.img == '') &&
                                !_model.erroImagem)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Adicionar foto da Empresa',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.nomeEmpresaTextController,
                                focusNode: _model.nomeEmpresaFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Nome da empresa',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
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
                                cursorColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                validator: _model
                                    .nomeEmpresaTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            FlutterFlowDropDown<int>(
                              controller:
                                  _model.atividadePrincipalValueController ??=
                                      FormFieldController<int>(null),
                              options: List<int>.from(_model.atividadesDropLista
                                  .map((e) => e.id)
                                  .toList()),
                              optionLabels: _model.atividadesDropLista
                                  .map((e) => e.name)
                                  .withoutNulls
                                  .toList()
                                  .sortedList(keyOf: (e) => e, desc: false),
                              onChanged: (val) => safeSetState(
                                  () => _model.atividadePrincipalValue = val),
                              width: double.infinity,
                              height: 46.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              hintText: valueOrDefault<String>(
                                widget.atividade != null
                                    ? widget.atividade?.name
                                    : 'Atividades',
                                'Atividades',
                              ),
                              searchHintText: 'Digite o nome',
                              searchCursorColor:
                                  FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 35.0,
                              ),
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderWidth: 1.0,
                              borderRadius: 4.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.info_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 21.0,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Não encontrou uma atividade? ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          TextSpan(
                                            text: ' Cadastre aqui.',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                context.pushNamed(
                                                  CadastrarAtividadeWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'criar': serializeParam(
                                                      widget.criar,
                                                      ParamType.bool,
                                                    ),
                                                    'phone': serializeParam(
                                                      widget.phone,
                                                      ParamType.String,
                                                    ),
                                                    'atividade': serializeParam(
                                                      widget.atividade,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'isUser': serializeParam(
                                                      widget.idUser,
                                                      ParamType.int,
                                                    ),
                                                    'endereco': serializeParam(
                                                      widget.endereco,
                                                      ParamType.String,
                                                    ),
                                                    'nomeEmpresa':
                                                        serializeParam(
                                                      _model
                                                          .nomeEmpresaTextController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'img': serializeParam(
                                                      _model
                                                          .uploadedFileUrl_uploadDataRy7,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 13.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 267.12,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            functions.validarEndereco(widget
                                                            .endereco !=
                                                        null &&
                                                    widget.endereco != ''
                                                ? widget.endereco!
                                                : '${_model.placePickerValue.address}${_model.placePickerValue.latLng.toString()}'),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: functions.validarEndereco(
                                                              '${_model.placePickerValue.address}${_model.placePickerValue.latLng.toString()}') ==
                                                          'Endereço incompleto. Por favor, selecione um endereço válido contendo: Rua, número, bairro, cidade, estado.'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .error
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: FlutterFlowPlacePicker(
                                  iOSGoogleMapsApiKey:
                                      'AIzaSyC6Lv11L9KMnGIJt8Zwg3UVTn8QvO3653I',
                                  androidGoogleMapsApiKey:
                                      'AIzaSyC6Lv11L9KMnGIJt8Zwg3UVTn8QvO3653I',
                                  webGoogleMapsApiKey:
                                      'AIzaSyC6Lv11L9KMnGIJt8Zwg3UVTn8QvO3653I',
                                  onSelect: (place) async {
                                    safeSetState(
                                        () => _model.placePickerValue = place);
                                  },
                                  defaultText: '',
                                  icon: Icon(
                                    Icons.place,
                                    color: Color(0x00141735),
                                    size: 25.0,
                                  ),
                                  buttonOptions: FFButtonOptions(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.rubik(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.transparent,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, 0.13),
                              child: Icon(
                                Icons.location_on_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.falltaEndereco)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Endereço obrigatório',
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
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.img != null &&
                                        _model.img != '') {
                                      if (functions.validarEndereco(widget
                                                          .endereco !=
                                                      null &&
                                                  widget.endereco != ''
                                              ? widget.endereco!
                                              : '${_model.placePickerValue.address}${_model.placePickerValue.latLng.toString()}') ==
                                          'Selecione um endereço.') {
                                        _model.falltaEndereco = true;
                                        safeSetState(() {});
                                      } else {
                                        _model.falltaEndereco = false;
                                        safeSetState(() {});
                                        if (functions.validarEndereco(widget
                                                            .endereco !=
                                                        null &&
                                                    widget.endereco != ''
                                                ? widget.endereco!
                                                : '${_model.placePickerValue.address}${_model.placePickerValue.latLng.toString()}') ==
                                            'Endereço incompleto. Por favor, selecione um endereço válido contendo: Rua, número, bairro, cidade, estado.') {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        _model.verif =
                                            await ProhibitedWordsTable()
                                                .queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'name',
                                            _model
                                                .nomeEmpresaTextController.text,
                                          ),
                                        );
                                        _shouldSetState = true;
                                        if (functions.compararMinuscula(
                                            _model.verif?.firstOrNull?.name,
                                            _model.nomeEmpresaTextController
                                                .text)) {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child:
                                                      NomeNaopermitidoWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ConfirmaEmpresaWidget(
                                                    img: _model.img,
                                                    nome: _model
                                                        .nomeEmpresaTextController
                                                        .text,
                                                    atividadeId: _model
                                                        .atividadePrincipalValue,
                                                    like: '',
                                                    avaliacao: '',
                                                    totalAvaliacao: '',
                                                    acao: () async {
                                                      if (widget.criar ==
                                                          true) {
                                                        _model.idCompany =
                                                            await CompanyTable()
                                                                .insert({
                                                          'name': _model
                                                              .nomeEmpresaTextController
                                                              .text,
                                                          'phone':
                                                              widget.phone,
                                                          'main_activity': _model
                                                              .atividadePrincipalValue,
                                                          'photo': _model.img,
                                                          'activated': true,
                                                          'user_profissional':
                                                              widget.idUser,
                                                          'user_created':
                                                              currentUserUid,
                                                          'address': widget
                                                                          .endereco !=
                                                                      null &&
                                                                  widget.endereco !=
                                                                      ''
                                                              ? widget.endereco
                                                              : '${_model.placePickerValue.address}${_model.placePickerValue.latLng.toString()}',
                                                        });
                                                        await UserProfissionaisTable()
                                                            .update(
                                                          data: {
                                                            'company': _model
                                                                .idCompany?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            widget.idUser,
                                                          ),
                                                        );
                                                      } else {
                                                        await CompanyTable()
                                                            .update(
                                                          data: {
                                                            'name': _model.nomeEmpresaTextController
                                                                            .text ==
                                                                        ''
                                                                ? widget
                                                                    .company
                                                                    ?.name
                                                                : _model
                                                                    .nomeEmpresaTextController
                                                                    .text,
                                                            'phone':
                                                                widget.phone,
                                                            'main_activity': _model
                                                                        .atividadePrincipalValue ==
                                                                    null
                                                                ? widget
                                                                    .company
                                                                    ?.mainActivity
                                                                : _model
                                                                    .atividadePrincipalValue,
                                                            'photo': _model.uploadedFileUrl_uploadDataRy7 ==
                                                                        ''
                                                                ? widget
                                                                    .company
                                                                    ?.phone
                                                                : _model.img,
                                                            'user_profissional':
                                                                widget.idUser,
                                                            'activated': true,
                                                            'user_created':
                                                                currentUserUid,
                                                            'address': widget
                                                                            .endereco !=
                                                                        null &&
                                                                    widget.endereco !=
                                                                        ''
                                                                ? widget
                                                                    .endereco
                                                                : '${_model.placePickerValue.address}${_model.placePickerValue.latLng.toString()}',
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            widget.company?.id,
                                                          ),
                                                        );
                                                        await UserProfissionaisTable()
                                                            .update(
                                                          data: {
                                                            'company': _model
                                                                .idComapany2
                                                                ?.firstOrNull
                                                                ?.id,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            widget.idUser,
                                                          ),
                                                        );
                                                      }

                                                      context.pushNamed(
                                                        ComoFuncionaWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }
                                    } else {
                                      _model.erroImagem = true;
                                      safeSetState(() {});
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Salvar',
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
