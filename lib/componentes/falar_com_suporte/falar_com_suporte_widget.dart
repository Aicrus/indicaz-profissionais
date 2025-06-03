import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'falar_com_suporte_model.dart';
export 'falar_com_suporte_model.dart';

class FalarComSuporteWidget extends StatefulWidget {
  const FalarComSuporteWidget({super.key});

  @override
  State<FalarComSuporteWidget> createState() => _FalarComSuporteWidgetState();
}

class _FalarComSuporteWidgetState extends State<FalarComSuporteWidget> {
  late FalarComSuporteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FalarComSuporteModel());

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
      width: 200.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 1.3,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Falar com o suporte',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Icon(
              Icons.mail_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ].divide(SizedBox(width: 5.0)),
        ),
      ),
    );
  }
}
