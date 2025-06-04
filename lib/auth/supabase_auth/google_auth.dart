import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../backend/supabase/supabase.dart';
import '../../flutter_flow/flutter_flow_util.dart';

// 🔥 FUNÇÃO ALTERNATIVA - OAuth Web direto (para contornar ApiException: 10)
Future<User?> googleSignInWebOAuth() async {
  try {
    print('🔄 [DEBUG] Tentando OAuth Web direto do Supabase...');
    
    final success = await SupaFlow.client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: kIsWeb ? null : 'com.mycompany.indicazprofissionais://login-callback',
    );
    
    if (success) {
      print('✅ [DEBUG] OAuth Web SUCCESS!');
      return SupaFlow.client.auth.currentUser;
    } else {
      print('❌ [DEBUG] OAuth Web falhou');
      return null;
    }
  } catch (error) {
    print('❌ [DEBUG] Erro no OAuth Web: $error');
    return null;
  }
}

Future<User?> googleSignInFunc() async {
  if (kIsWeb) {
    final success =
        await SupaFlow.client.auth.signInWithOAuth(OAuthProvider.google);
    return success ? SupaFlow.client.auth.currentUser : null;
  }

  print('🔄 [DEBUG] Iniciando Google Sign In...');
  
  // TESTANDO SEM serverClientId (só OAuth web)
  final googleSignIn = GoogleSignIn(
    scopes: ['profile', 'email'],
    // SEM serverClientId para testar
  );

  try {
    print('🔄 [DEBUG] Fazendo signOut primeiro...');
    await googleSignIn.signOut().catchError((_) => null);
    
    print('🔄 [DEBUG] Chamando googleSignIn.signIn()...');
    final googleUser = await googleSignIn.signIn();
    
    if (googleUser == null) {
      print('❌ [DEBUG] Usuário cancelou o login');
      return null;
    }

    print('✅ [DEBUG] Google User obtido: ${googleUser.email}');
    
    final googleAuth = await googleUser.authentication;
    
    if (googleAuth.idToken == null) {
      print('❌ [DEBUG] ID Token é null');
      return null;
    }

    if (googleAuth.accessToken == null) {
      print('❌ [DEBUG] Access Token é null');
      return null;
    }

    print('✅ [DEBUG] Tokens obtidos, fazendo auth no Supabase...');
    print('✅ [DEBUG] idToken: ${googleAuth.idToken?.substring(0, 20)}...');
    
    final response = await SupaFlow.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
      accessToken: googleAuth.accessToken,
    );

    print('✅ [DEBUG] Supabase auth SUCCESS: ${response.user?.email}');
    return response.user;
    
  } catch (error) {
    print('❌ [DEBUG] Erro detalhado no Google Sign In: $error');
    
    // Se o erro for ApiException: 10, tentar OAuth web
    if (error.toString().contains('ApiException: 10')) {
      print('💡 [DEBUG] ApiException: 10 = Tentando OAuth Web como alternativa...');
      return await googleSignInWebOAuth();
    }
    
    return null;
  }
}
