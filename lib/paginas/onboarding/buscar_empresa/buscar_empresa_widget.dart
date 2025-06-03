import '/backend/supabase/supabase.dart';
import '/componentes/empresa_nao_cadastrada/empresa_nao_cadastrada_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buscar_empresa_model.dart';
export 'buscar_empresa_model.dart';

class BuscarEmpresaWidget extends StatefulWidget {
  const BuscarEmpresaWidget({
    super.key,
    this.telefone,
    this.idUser,
    bool? voltar,
  }) : this.voltar = voltar ?? true;

  final String? telefone;
  final int? idUser;
  final bool voltar;

  static String routeName = 'BuscarEmpresa';
  static String routePath = '/buscarEmpresa';

  @override
  State<BuscarEmpresaWidget> createState() => _BuscarEmpresaWidgetState();
}

class _BuscarEmpresaWidgetState extends State<BuscarEmpresaWidget> {
  late BuscarEmpresaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarEmpresaModel());

    _model.textFieldTelefoneTextController ??=
        TextEditingController(text: functions.removeMais55(widget.telefone!));
    _model.textFieldTelefoneFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CompanyRow>>(
      future: CompanyTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'phone',
          '55${widget.telefone}',
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CompanyRow> buscarEmpresaCompanyRowList = snapshot.data!;

        final buscarEmpresaCompanyRow = buscarEmpresaCompanyRowList.isNotEmpty
            ? buscarEmpresaCompanyRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.voltar)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                          ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                  Text(
                    'Buscar Empresa',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 28.0),
                            child: Text(
                              'Encontramos uma empresa cadastrada no indicaz associada ao seu telefone.',
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
                                    fontSize: 15.0,
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
                          Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 200.0,
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldTelefoneTextController,
                                          focusNode:
                                              _model.textFieldTelefoneFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textFieldTelefoneTextController',
                                            Duration(milliseconds: 100),
                                            () async {
                                              _model.remove55 = _model
                                                  .textFieldTelefoneTextController
                                                  .text;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.textFieldTelefoneTextController
                                                        ?.text =
                                                    functions.removeMais55(
                                                        _model.remove55!);
                                                _model
                                                    .textFieldTelefoneFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.textFieldTelefoneTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .textFieldTelefoneTextController!
                                                        .text
                                                        .length,
                                                  );
                                                });
                                                _model.textFieldTelefoneMask
                                                    .updateMask(
                                                  newValue: TextEditingValue(
                                                    text: _model
                                                        .textFieldTelefoneTextController!
                                                        .text,
                                                    selection:
                                                        TextSelection.collapsed(
                                                      offset: _model
                                                          .textFieldTelefoneTextController!
                                                          .text
                                                          .length,
                                                    ),
                                                  ),
                                                );
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                            },
                                          ),
                                          autofocus: false,
                                          textInputAction: TextInputAction.done,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Telefone',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 16.0,
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
                                            hintText: 'Telefone',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .hintTextField,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            errorStyle:
                                                FlutterFlowTheme.of(context)
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 16.0,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
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
                                          keyboardType: TextInputType.phone,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textFieldTelefoneTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.textFieldTelefoneMask
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 9.0, 8.0, 0.0),
                                    child: Icon(
                                      Icons.check_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .iconSucess,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              if (buscarEmpresaCompanyRow?.phone ==
                                  '55${widget.telefone}')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: FutureBuilder<List<ActivityRow>>(
                                          future:
                                              ActivityTable().querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              buscarEmpresaCompanyRow
                                                  ?.mainActivity,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ActivityRow>
                                                containerActivityRowList =
                                                snapshot.data!;

                                            final containerActivityRow =
                                                containerActivityRowList
                                                        .isNotEmpty
                                                    ? containerActivityRowList
                                                        .first
                                                    : null;

                                            return Container(
                                              width: double.infinity,
                                              height: 85.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                                border: Border.all(
                                                  color: Color(0xFFD0D5DD),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                buscarEmpresaCompanyRow
                                                                            ?.photo ==
                                                                        null ||
                                                                    buscarEmpresaCompanyRow
                                                                            ?.photo ==
                                                                        '',
                                                                false,
                                                              )) {
                                                                return Container(
                                                                  width: 52.0,
                                                                  height: 52.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .borderColorPrimary,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFD9D9D9),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.iniciaisName(
                                                                          buscarEmpresaCompanyRow!
                                                                              .name!),
                                                                      'A',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: 52.0,
                                                                  height: 52.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        buscarEmpresaCompanyRow!
                                                                            .photo!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              buscarEmpresaCompanyRow?.name,
                                                                              'nome',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.rubik(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              containerActivityRow?.name,
                                                                              'Atividade Principal',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                FFIcons.kthumbsUp,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 14.0,
                                                                              ),
                                                                              FutureBuilder<List<LikeCompanyRow>>(
                                                                                future: LikeCompanyTable().queryRows(
                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                    'company_id',
                                                                                    buscarEmpresaCompanyRow?.id,
                                                                                  ),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: CircularProgressIndicator(
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<LikeCompanyRow> textLikeCompanyRowList = snapshot.data!;

                                                                                  return Text(
                                                                                    valueOrDefault<String>(
                                                                                      textLikeCompanyRowList.length.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          List<
                                                                              CompanyReviewsByHousingRow>>(
                                                                        future:
                                                                            CompanyReviewsByHousingTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eqOrNull(
                                                                            'company_id',
                                                                            buscarEmpresaCompanyRow?.id,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<CompanyReviewsByHousingRow>
                                                                              containerReviewsCompanyReviewsByHousingRowList =
                                                                              snapshot.data!;

                                                                          final containerReviewsCompanyReviewsByHousingRow = containerReviewsCompanyReviewsByHousingRowList.isNotEmpty
                                                                              ? containerReviewsCompanyReviewsByHousingRowList.first
                                                                              : null;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.star,
                                                                                  color: Color(0xFFFFB000),
                                                                                  size: 15.0,
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      containerReviewsCompanyReviewsByHousingRow?.averageRating,
                                                                                      formatType: FormatType.compact,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '(${valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      containerReviewsCompanyReviewsByHousingRow?.totalReviews,
                                                                                      formatType: FormatType.compact,
                                                                                    ),
                                                                                    '0',
                                                                                  )})',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w300,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 2.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (buscarEmpresaCompanyRow
                                              ?.housingCreated !=
                                          null)
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FutureBuilder<
                                                  List<UserResidentRow>>(
                                                future: UserResidentTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    valueOrDefault<String>(
                                                      buscarEmpresaCompanyRow
                                                          ?.userCreated,
                                                      '0',
                                                    ),
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UserResidentRow>
                                                      containerUserResidentRowList =
                                                      snapshot.data!;

                                                  final containerUserResidentRow =
                                                      containerUserResidentRowList
                                                              .isNotEmpty
                                                          ? containerUserResidentRowList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Indicado por',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              if (containerUserResidentRow
                                                                      ?.id ==
                                                                  buscarEmpresaCompanyRow
                                                                      ?.userCreated)
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      "d/M/y",
                                                                      containerUserResidentRow
                                                                          ?.createdAt,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'data',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (containerUserResidentRow
                                                                    ?.id ==
                                                                buscarEmpresaCompanyRow
                                                                    ?.userCreated)
                                                              Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUserResidentRow
                                                                            ?.photo,
                                                                        'https://s3.eu-central-1.amazonaws.com/uploads.mangoweb.org/shared-prod/visegradfund.org/uploads/2021/08/placeholder-male.jpg',
                                                                      ),
                                                                    ).image,
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                              ),
                                                            if (containerUserResidentRow
                                                                    ?.id ==
                                                                buscarEmpresaCompanyRow
                                                                    ?.userCreated)
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  containerUserResidentRow
                                                                      ?.name,
                                                                  'nome',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              Divider(
                                                height: 3.0,
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              FutureBuilder<List<HousingRow>>(
                                                future: HousingTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    valueOrDefault<int>(
                                                      buscarEmpresaCompanyRow
                                                          ?.housingCreated,
                                                      0,
                                                    ),
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<HousingRow>
                                                      containerHousingRowList =
                                                      snapshot.data!;

                                                  final containerHousingRow =
                                                      containerHousingRowList
                                                              .isNotEmpty
                                                          ? containerHousingRowList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (containerHousingRow
                                                                  ?.id ==
                                                              buscarEmpresaCompanyRow
                                                                  ?.housingCreated)
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Building.png',
                                                                width: 30.0,
                                                                height: 30.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (containerHousingRow
                                                                        ?.id ==
                                                                    buscarEmpresaCompanyRow
                                                                        ?.housingCreated)
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHousingRow
                                                                          ?.houseName,
                                                                      'Endereço',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.rubik(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                if (containerHousingRow
                                                                        ?.id ==
                                                                    buscarEmpresaCompanyRow
                                                                        ?.housingCreated)
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerHousingRow
                                                                          ?.fullAddress,
                                                                      'Endereço detalhe',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Divider(
                                                height: 1.0,
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.userProfisisonal =
                                                      await UserProfissionaisTable()
                                                          .queryRows(
                                                    queryFn: (q) => q.eqOrNull(
                                                      'phone',
                                                      buscarEmpresaCompanyRow
                                                          ?.phone,
                                                    ),
                                                  );
                                                  await CompanyTable().update(
                                                    data: {
                                                      'user_profissional':
                                                          _model
                                                              .userProfisisonal
                                                              ?.firstOrNull
                                                              ?.id,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'id',
                                                      buscarEmpresaCompanyRow
                                                          ?.id,
                                                    ),
                                                  );
                                                  _model.atividadeCompany =
                                                      await ActivityTable()
                                                          .queryRows(
                                                    queryFn: (q) => q.eqOrNull(
                                                      'id',
                                                      _model
                                                          .company
                                                          ?.firstOrNull
                                                          ?.mainActivity,
                                                    ),
                                                  );

                                                  context.pushNamed(
                                                    DadosEmpresaWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'company': serializeParam(
                                                        buscarEmpresaCompanyRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'idUser': serializeParam(
                                                        widget.idUser,
                                                        ParamType.int,
                                                      ),
                                                      'criar': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                      'atividade':
                                                          serializeParam(
                                                        _model.atividadeCompany
                                                            ?.firstOrNull,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'phone': serializeParam(
                                                        '55${widget.telefone}',
                                                        ParamType.String,
                                                      ),
                                                      'nomeEmpresa':
                                                          serializeParam(
                                                        buscarEmpresaCompanyRow
                                                            ?.name,
                                                        ParamType.String,
                                                      ),
                                                      'img': serializeParam(
                                                        buscarEmpresaCompanyRow
                                                            ?.photo,
                                                        ParamType.String,
                                                      ),
                                                      'endereco':
                                                          serializeParam(
                                                        buscarEmpresaCompanyRow
                                                            ?.address,
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

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    'Resgatar Perfil da Empresa',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Você poderá editar as informações da sua empresa após resgatar seu perfil.',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 13.0,
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
                                    ].divide(SizedBox(height: 15.0)),
                                  ),
                                ),
                              if ((buscarEmpresaCompanyRow?.phone !=
                                      '55${widget.telefone}') &&
                                  (_model.textFieldTelefoneTextController
                                              .text !=
                                          '') &&
                                  !_model.loading)
                                Container(
                                  width: double.infinity,
                                  height: 469.0,
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: buscarEmpresaCompanyRow?.phone !=
                                        '55${widget.telefone}',
                                    child: wrapWithModel(
                                      model: _model.empresaNaoCadastradaModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: EmpresaNaoCadastradaWidget(
                                        idUser: widget.idUser,
                                        phone: widget.telefone!,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
