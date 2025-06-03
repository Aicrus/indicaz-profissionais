import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'duvidas_frequentes_model.dart';
export 'duvidas_frequentes_model.dart';

class DuvidasFrequentesWidget extends StatefulWidget {
  const DuvidasFrequentesWidget({super.key});

  @override
  State<DuvidasFrequentesWidget> createState() =>
      _DuvidasFrequentesWidgetState();
}

class _DuvidasFrequentesWidgetState extends State<DuvidasFrequentesWidget> {
  late DuvidasFrequentesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DuvidasFrequentesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Nenhuma resposta encontrada.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Text(
            'Tente outro termo ou fale com o suporte para receber ajuda.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/hand-drawn-engineer-architect-flat-style-isolated-background.png',
              width: 200.0,
              height: 127.0,
              fit: BoxFit.contain,
            ),
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
