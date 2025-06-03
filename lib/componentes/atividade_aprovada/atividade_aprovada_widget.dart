import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'atividade_aprovada_model.dart';
export 'atividade_aprovada_model.dart';

class AtividadeAprovadaWidget extends StatefulWidget {
  const AtividadeAprovadaWidget({
    super.key,
    this.detalhes,
    this.company,
    this.criar,
    this.idUser,
    this.phone,
    this.atividade,
    this.nomeEmpresa,
    this.endereco,
    this.img,
    bool? perfilEmpresa,
  }) : this.perfilEmpresa = perfilEmpresa ?? false;

  final String? detalhes;
  final CompanyRow? company;
  final bool? criar;
  final int? idUser;
  final String? phone;
  final ActivityRow? atividade;
  final String? nomeEmpresa;
  final String? endereco;
  final String? img;
  final bool perfilEmpresa;

  @override
  State<AtividadeAprovadaWidget> createState() =>
      _AtividadeAprovadaWidgetState();
}

class _AtividadeAprovadaWidgetState extends State<AtividadeAprovadaWidget> {
  late AtividadeAprovadaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AtividadeAprovadaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.0,
      height: 266.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).backSucess,
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.checkCircle,
                  color: FlutterFlowTheme.of(context).iconSucess,
                  size: 25.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Text(
                'Atividade aprovada!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'O cadastro da atividade ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    TextSpan(
                      text: valueOrDefault<String>(
                        widget.detalhes,
                        'Pintor ',
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' foi validado e está de acordo com as políticas do indicaz.',
                      style: TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        lineHeight: 1.3,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    context.safePop();
                  },
                  text: 'Voltar',
                  options: FFButtonOptions(
                    width: 120.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).info,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.rubik(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    _model.atividadeCadastrada = await ActivityTable().insert({
                      'name': widget.detalhes,
                      'status': true,
                    });
                    if (widget.perfilEmpresa) {
                      context.pushNamed(
                        PerfilEmpresaWidget.routeName,
                        queryParameters: {
                          'company': serializeParam(
                            widget.company,
                            ParamType.SupabaseRow,
                          ),
                          'atividade': serializeParam(
                            _model.atividadeCadastrada,
                            ParamType.SupabaseRow,
                          ),
                          'categoria': serializeParam(
                            3,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      context.pushNamed(
                        DadosEmpresaWidget.routeName,
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
                            _model.atividadeCadastrada,
                            ParamType.SupabaseRow,
                          ),
                          'idUser': serializeParam(
                            widget.idUser,
                            ParamType.int,
                          ),
                          'endereco': serializeParam(
                            widget.endereco,
                            ParamType.String,
                          ),
                          'nomeEmpresa': serializeParam(
                            widget.nomeEmpresa,
                            ParamType.String,
                          ),
                          'img': serializeParam(
                            widget.img,
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

                    safeSetState(() {});
                  },
                  text: 'Cadastrar',
                  options: FFButtonOptions(
                    width: 120.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.rubik(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 1.5,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
