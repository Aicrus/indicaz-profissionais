import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_housingUser')) {
        try {
          final serializedData = prefs.getString('ff_housingUser') ?? '{}';
          _housingUser =
              HousingStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _code = '';
  String get code => _code;
  set code(String value) {
    _code = value;
  }

  HousingStruct _housingUser =
      HousingStruct.fromSerializableMap(jsonDecode('{}'));
  HousingStruct get housingUser => _housingUser;
  set housingUser(HousingStruct value) {
    _housingUser = value;
    prefs.setString('ff_housingUser', value.serialize());
  }

  void updateHousingUserStruct(Function(HousingStruct) updateFn) {
    updateFn(_housingUser);
    prefs.setString('ff_housingUser', _housingUser.serialize());
  }

  int _idCompany = 0;
  int get idCompany => _idCompany;
  set idCompany(int value) {
    _idCompany = value;
  }

  String _pass = '';
  String get pass => _pass;
  set pass(String value) {
    _pass = value;
  }

  String _escolhaAtividadeLista = '';
  String get escolhaAtividadeLista => _escolhaAtividadeLista;
  set escolhaAtividadeLista(String value) {
    _escolhaAtividadeLista = value;
  }

  String _nomeTexfield = '';
  String get nomeTexfield => _nomeTexfield;
  set nomeTexfield(String value) {
    _nomeTexfield = value;
  }

  bool _aceitarTermosCondicoes = false;
  bool get aceitarTermosCondicoes => _aceitarTermosCondicoes;
  set aceitarTermosCondicoes(bool value) {
    _aceitarTermosCondicoes = value;
  }

  String _nomeEmpresaAtualizar = '';
  String get nomeEmpresaAtualizar => _nomeEmpresaAtualizar;
  set nomeEmpresaAtualizar(String value) {
    _nomeEmpresaAtualizar = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
