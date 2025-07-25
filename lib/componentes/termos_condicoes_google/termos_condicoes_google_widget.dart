import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termos_condicoes_google_model.dart';
export 'termos_condicoes_google_model.dart';

class TermosCondicoesGoogleWidget extends StatefulWidget {
  const TermosCondicoesGoogleWidget({super.key});

  @override
  State<TermosCondicoesGoogleWidget> createState() =>
      _TermosCondicoesGoogleWidgetState();
}

class _TermosCondicoesGoogleWidgetState
    extends State<TermosCondicoesGoogleWidget> {
  late TermosCondicoesGoogleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosCondicoesGoogleModel());

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
      height: 320.0,
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
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFFC7ECFF),
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.questionCircle,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 23.0,
                ),
              ),
            ),
            Text(
              'Aceite os termos e políticas para criar uma conta',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
              child: Text(
                'Conecte-se com clientes da sua \nregião e constura sua reputação',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).hintTextField,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue = newValue!);
                      if (newValue!) {
                        _model.acietarTermos = false;
                        safeSetState(() {});
                      } else {
                        _model.acietarTermos = true;
                        safeSetState(() {});
                      }
                    },
                    side: (FlutterFlowTheme.of(context).hintTextField != null)
                        ? BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).hintTextField!,
                          )
                        : null,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://indicaz.app/politica-de-privacidade/');
                      },
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Li e estou de acordo com o ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  'Termo de Serviço e Política de Privacidade.',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (!_model.checkboxValue!)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Você precisa aceitar os termos e condições.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).iconFail,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
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
                    if (_model.checkboxValue == true) {
                      _model.acietarTermos = false;
                      _model.updatePage(() {});
                      GoRouter.of(context).prepareAuthEvent();
                      final user = await authManager.signInWithGoogle(context);
                      if (user == null) {
                        return;
                      }
                      _model.profissionalUser = await actions.getUser();
                      _model.verificacaoUserMorador =
                          await UserResidentTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'email',
                          _model.profissionalUser?.id,
                        ),
                      );
                      _model.verificacaoUseProfissional =
                          await UserProfissionaisTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'email',
                          _model.profissionalUser?.email,
                        ),
                      );
                      if (((_model.verificacaoUserMorador != null &&
                                  (_model.verificacaoUserMorador)!
                                      .isNotEmpty) ==
                              true) &&
                          ((_model.verificacaoUseProfissional != null &&
                                  (_model.verificacaoUseProfissional)!
                                      .isNotEmpty) ==
                              false)) {
                        await UserProfissionaisTable().insert({
                          'email': currentUserEmail,
                          'provider': 'google',
                          'is_onbarding': false,
                        });

                        context.pushNamedAuth(
                          DadosPessoaisWidget.routeName,
                          context.mounted,
                          queryParameters: {
                            'email': serializeParam(
                              _model.profissionalUser?.email,
                              ParamType.String,
                            ),
                            'provedor': serializeParam(
                              'google',
                              ParamType.String,
                            ),
                            'nome': serializeParam(
                              _model.profissionalUser?.name,
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
                      } else if (((_model.verificacaoUserMorador != null &&
                                  (_model.verificacaoUserMorador)!
                                      .isNotEmpty) ==
                              false) &&
                          ((_model.verificacaoUseProfissional != null &&
                                  (_model.verificacaoUseProfissional)!
                                      .isNotEmpty) ==
                              false)) {
                        await UserProfissionaisTable().insert({
                          'email': currentUserEmail,
                          'provider': 'google',
                          'is_onbarding': false,
                        });

                        context.pushNamedAuth(
                          DadosPessoaisWidget.routeName,
                          context.mounted,
                          queryParameters: {
                            'email': serializeParam(
                              _model.profissionalUser?.email,
                              ParamType.String,
                            ),
                            'provedor': serializeParam(
                              'google',
                              ParamType.String,
                            ),
                            'nome': serializeParam(
                              _model.profissionalUser?.name,
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
                      } else {
                        context.pushNamedAuth(
                          SplashWidget.routeName,
                          context.mounted,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }
                    } else {
                      _model.acietarTermos = true;
                      _model.updatePage(() {});
                    }

                    safeSetState(() {});
                  },
                  text: 'Confirmar',
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
