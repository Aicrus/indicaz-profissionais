// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> nomeSobrenome(String nomeCompleto) async {
  // Add your function code here!

  // Verifica se o nome completo foi fornecido
  if (nomeCompleto.trim().isEmpty) {
    return {
      'nome': '',
      'sobrenome': '',
    };
  }

  // Divide o nome completo em partes
  List<String> partes = nomeCompleto.trim().split(' ');

  // Separa o primeiro nome
  String nome = partes.first;

  // Junta o restante como sobrenome
  String sobrenome = partes.length > 1 ? partes.sublist(1).join(' ') : '';

  // Retorna em formato JSON
  return {
    'nome': nome,
    'sobrenome': sobrenome,
  };
}
