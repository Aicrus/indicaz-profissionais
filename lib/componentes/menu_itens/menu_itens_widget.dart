import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_itens_model.dart';
export 'menu_itens_model.dart';

class MenuItensWidget extends StatefulWidget {
  const MenuItensWidget({super.key});

  @override
  State<MenuItensWidget> createState() => _MenuItensWidgetState();
}

class _MenuItensWidgetState extends State<MenuItensWidget> {
  late MenuItensModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuItensModel());

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
      width: 179.0,
      height: 116.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x1E000000),
            offset: Offset(
              0.0,
              0.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.kvectorStrokesToFills,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 13.0,
                ),
                Text(
                  'Painel Visibilidade',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 14.0,
                ),
                Text(
                  'Ver meu perfil',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.kidentificacaoSVGConvertido,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 16.0,
                ),
                Text(
                  'Ver meu contato',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ].divide(SizedBox(height: 15.0)),
        ),
      ),
    );
  }
}
