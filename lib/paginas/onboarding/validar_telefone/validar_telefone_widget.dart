import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/erro/erro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'validar_telefone_model.dart';
export 'validar_telefone_model.dart';

class ValidarTelefoneWidget extends StatefulWidget {
  const ValidarTelefoneWidget({
    super.key,
    this.imagem,
    this.nomeCompleto,
    this.numero,
    this.email,
  });

  final String? imagem;
  final String? nomeCompleto;
  final String? numero;
  final String? email;

  static String routeName = 'ValidarTelefone';
  static String routePath = '/validarTelefone';

  @override
  State<ValidarTelefoneWidget> createState() => _ValidarTelefoneWidgetState();
}

class _ValidarTelefoneWidgetState extends State<ValidarTelefoneWidget> {
  late ValidarTelefoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValidarTelefoneModel());

    _model.pinCodeFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).info,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 65.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  'Insira o código',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Insira o código de 4 dígitos que foi enviado via Whatsapp no número ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget!.numero,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 15.0,
                        ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 4,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    enableActiveFill: false,
                    autoFocus: true,
                    focusNode: _model.pinCodeFocusNode,
                    enablePinAutofill: false,
                    errorTextSpace: 16.0,
                    showCursor: true,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    obscureText: false,
                    hintCharacter: '●',
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      fieldHeight: 55.0,
                      fieldWidth: 55.0,
                      borderWidth: 2.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0),
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0),
                      ),
                      shape: PinCodeFieldShape.box,
                      activeColor: FlutterFlowTheme.of(context).primaryText,
                      inactiveColor: FlutterFlowTheme.of(context).alternate,
                      selectedColor: FlutterFlowTheme.of(context).primary,
                    ),
                    controller: _model.pinCodeController,
                    onChanged: (_) {},
                    onCompleted: (_) async {
                      _model.userProfissional2 = await actions.nomeSobrenome(
                        widget!.nomeCompleto!,
                      );
                      if (_model.pinCodeController!.text == FFAppState().code) {
                        if (loggedIn) {
                          await UserProfissionaisTable().update(
                            data: {
                              'email': widget!.email,
                              'nome': getJsonField(
                                _model.userProfissional2,
                                r'''$.nome''',
                              ).toString(),
                              'sobrenome': getJsonField(
                                _model.userProfissional2,
                                r'''$.sobrenome''',
                              ).toString(),
                              'phone': functions
                                  .formataPhoneSupabase(widget!.numero!),
                              'foto': widget!.imagem,
                              'is_onbarding': true,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'email',
                              widget!.email,
                            ),
                          );

                          context.pushNamedAuth(
                            BuscarEmpresaWidget.routeName,
                            context.mounted,
                            queryParameters: {
                              'telefone': serializeParam(
                                widget!.numero,
                                ParamType.String,
                              ),
                              'idUser': serializeParam(
                                _model.userProID?.firstOrNull?.id,
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
                          GoRouter.of(context).prepareAuthEvent();
                          if (FFAppState().pass != FFAppState().pass) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'As senhas não correspondem',
                                ),
                              ),
                            );
                            return;
                          }

                          final user = await authManager.createAccountWithEmail(
                            context,
                            widget!.email!,
                            FFAppState().pass,
                          );
                          if (user == null) {
                            return;
                          }

                          await UserProfissionaisTable().update(
                            data: {
                              'email': widget!.email,
                              'nome': getJsonField(
                                _model.userProfissional2,
                                r'''$.nome''',
                              ).toString(),
                              'sobrenome': getJsonField(
                                _model.userProfissional2,
                                r'''$.sobrenome''',
                              ).toString(),
                              'phone': functions
                                  .formataPhoneSupabase(widget!.numero!),
                              'foto': widget!.imagem,
                              'is_onbarding': true,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'email',
                              widget!.email,
                            ),
                          );

                          context.pushNamedAuth(
                            BuscarEmpresaWidget.routeName,
                            context.mounted,
                            queryParameters: {
                              'telefone': serializeParam(
                                widget!.numero,
                                ParamType.String,
                              ),
                              'idUser': serializeParam(
                                _model.userProID2?.firstOrNull?.id,
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
                        }
                      } else {
                        showDialog(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.9)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Container(
                                  height: 75.0,
                                  width: 210.0,
                                  child: ErroWidget(
                                    title: 'Código inválido',
                                    description:
                                        'Tente novamente ou verifique se o número do WhatsApp está correto.',
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                        await Future.delayed(
                            const Duration(milliseconds: 2500));
                        Navigator.pop(context);
                        safeSetState(() {
                          _model.pinCodeController?.clear();
                        });
                      }

                      safeSetState(() {});
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.tentativasMax >= 1) {
                          FFAppState().code =
                              random_data.randomInteger(1000, 9000).toString();
                          safeSetState(() {});
                          _model.numero2 =
                              await TwilioWhatsAppCodeProducaoCall.call(
                            code: '{\"1\":\"${FFAppState().code}\"}',
                            phone:
                                'whatsapp:${functions.formataPhoneAPI('+55${widget!.numero}')}',
                          );

                          safeSetState(() {
                            _model.pinCodeController?.clear();
                          });
                        } else {
                          context.pushNamed(
                            DadosPessoaisWidget.routeName,
                            queryParameters: {
                              'nome': serializeParam(
                                widget!.nomeCompleto,
                                ParamType.String,
                              ),
                              'urlImage': serializeParam(
                                widget!.imagem,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }

                        safeSetState(() {});
                      },
                      child: Text(
                        'Enviar novamente',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().code = '';
                  FFAppState().update(() {});

                  context.pushNamed(
                    DadosPessoaisWidget.routeName,
                    queryParameters: {
                      'nome': serializeParam(
                        widget!.nomeCompleto,
                        ParamType.String,
                      ),
                      'urlImage': serializeParam(
                        widget!.imagem,
                        ParamType.String,
                      ),
                      'phone': serializeParam(
                        widget!.numero,
                        ParamType.String,
                      ),
                      'email': serializeParam(
                        widget!.email,
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
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alterar telefone',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
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
