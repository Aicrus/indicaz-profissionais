import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _likeFamily = 'Like';
  static const String _icomoonFamily = 'Icomoon';
  static const String _sairFamily = 'Sair';
  static const String _docFamily = 'Doc';
  static const String _vectorStrokesToFillsFamily = 'VectorStrokesToFills';
  static const String _starFamily = 'Star';
  static const String _filterFamily = 'Filter';

  // Like
  static const IconData kthumbsUp = IconData(0xe800, fontFamily: _likeFamily);

  // icomoon
  static const IconData kidentificacaoSVGConvertido =
      IconData(0xe900, fontFamily: _icomoonFamily);

  // sair
  static const IconData karrowLeftStartOnRectangle =
      IconData(0xe901, fontFamily: _sairFamily);

  // Doc
  static const IconData kdocument = IconData(0xe900, fontFamily: _docFamily);

  // Vector-Strokes-to-Fills
  static const IconData kvectorStrokesToFills =
      IconData(0xe900, fontFamily: _vectorStrokesToFillsFamily);

  // star
  static const IconData kstar5Converted =
      IconData(0xe900, fontFamily: _starFamily);

  // Filter
  static const IconData kadjustmentsHorizontalConverted =
      IconData(0xe900, fontFamily: _filterFamily);
}
