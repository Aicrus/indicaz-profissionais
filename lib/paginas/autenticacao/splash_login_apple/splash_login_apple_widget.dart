import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'splash_login_apple_model.dart';
export 'splash_login_apple_model.dart';

class SplashLoginAppleWidget extends StatefulWidget {
  const SplashLoginAppleWidget({
    super.key,
    required this.provadorAuth,
  });

  final String? provadorAuth;

  static String routeName = 'splashLoginApple';
  static String routePath = '/splashLoginApple';

  @override
  State<SplashLoginAppleWidget> createState() => _SplashLoginAppleWidgetState();
}

class _SplashLoginAppleWidgetState extends State<SplashLoginAppleWidget>
    with TickerProviderStateMixin {
  late SplashLoginAppleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashLoginAppleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInWithApple(context);
      if (user == null) {
        return;
      }
      _model.user = await actions.getUser();
      await UserProfissionaisTable().insert({
        'email': currentUserEmail,
        'provider': 'apple',
        'is_onbarding': false,
      });

      context.pushNamedAuth(
        DadosPessoaisWidget.routeName,
        context.mounted,
        queryParameters: {
          'provedor': serializeParam(
            'apple',
            ParamType.String,
          ),
          'email': serializeParam(
            _model.user?.email,
            ParamType.String,
          ),
          'nome': serializeParam(
            _model.user?.name,
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
    });

    animationsMap.addAll({
      'progressBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/az_branco_amarelo.svg',
                  width: 155.0,
                  height: 120.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: LinearPercentIndicator(
                  percent: _model.progresso,
                  lineHeight: 8.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).amareloLogo,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  barRadius: Radius.circular(14.0),
                  padding: EdgeInsets.zero,
                ).animateOnPageLoad(
                    animationsMap['progressBarOnPageLoadAnimation']!),
              ),
            ].divide(SizedBox(height: 109.0)),
          ),
        ),
      ),
    );
  }
}
