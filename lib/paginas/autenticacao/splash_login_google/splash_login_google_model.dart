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
import 'splash_login_google_widget.dart' show SplashLoginGoogleWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SplashLoginGoogleModel extends FlutterFlowModel<SplashLoginGoogleWidget> {
  ///  Local state fields for this page.

  double progresso = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUser] action in splashLoginGoogle widget.
  UserInfoStruct? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
