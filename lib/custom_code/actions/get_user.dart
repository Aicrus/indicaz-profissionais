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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<UserInfoStruct> getUser() async {
  //Obtendo o cliente Supabase corretamente
  final supabase = Supabase.instance.client;

  // Verifica se há um usuário autenticado
  final user = supabase.auth.currentUser;
  if (user == null) {
    throw Exception('Nenhum usuário autenticado');
  }

  // Obtém os dados do usuário com segurança
  String email = user.email ?? '';
  String name = user.userMetadata?['full_name'] ?? '';
  String image = user.userMetadata?['picture'] ?? '';

  return UserInfoStruct(email: email, image: image, name: name);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
