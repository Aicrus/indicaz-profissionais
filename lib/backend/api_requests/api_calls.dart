import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase Functions Group Code

class SupabaseFunctionsGroup {
  static String getBaseUrl() =>
      'https://kwxrvofwloojsecxvbaz.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3eHJ2b2Z3bG9vanNlY3h2YmF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4MzMwNjgsImV4cCI6MjA0OTQwOTA2OH0.ygmf9blRYALuXahcnkimTx9qwouSMw7j0QTxg6tpWqY',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3eHJ2b2Z3bG9vanNlY3h2YmF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4MzMwNjgsImV4cCI6MjA0OTQwOTA2OH0.ygmf9blRYALuXahcnkimTx9qwouSMw7j0QTxg6tpWqY',
  };
  static GetCompanyDetailsCall getCompanyDetailsCall = GetCompanyDetailsCall();
}

class GetCompanyDetailsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? housingId,
    int? companyId,
  }) async {
    final baseUrl = SupabaseFunctionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "company_id_param": "${companyId}",
  "housing_id_param": "${housingId}",
  "uid": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get company details',
      apiUrl: '${baseUrl}/get_company_details',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3eHJ2b2Z3bG9vanNlY3h2YmF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4MzMwNjgsImV4cCI6MjA0OTQwOTA2OH0.ygmf9blRYALuXahcnkimTx9qwouSMw7j0QTxg6tpWqY',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3eHJ2b2Z3bG9vanNlY3h2YmF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4MzMwNjgsImV4cCI6MjA0OTQwOTA2OH0.ygmf9blRYALuXahcnkimTx9qwouSMw7j0QTxg6tpWqY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Supabase Functions Group Code

/// Start OpenAI API Group Code

class OpenAIAPIGroup {
  static String getBaseUrl() => 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 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',
  };
  static CreateChatCompletionCall createChatCompletionCall =
      CreateChatCompletionCall();
}

class CreateChatCompletionCall {
  Future<ApiCallResponse> call({
    String? activityName = '',
  }) async {
    final baseUrl = OpenAIAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "messages": [
    {
      "role": "system",
      "content": "Você é um moderador de atividades cadastrais. Seu objetivo é validar nomes de atividades comerciais para garantir que sejam apropriados, não contenham termos proibidos, ofensivos ou ilegais e estejam alinhados com as regras da plataforma.\\n\\n### 🛑 **Critérios de Reprovação**  \\nA atividade deve ser **REPROVADA** (responda apenas com \`DISAPPROVED\`) se se encaixar em alguma das categorias abaixo:\\n\\n1️⃣ **Atividades Ilegais ou Fraudulentas**: Qualquer referência a serviços que envolvam práticas ilegais, fraudes, golpes financeiros ou falsificações.\\n2️⃣ **Conteúdo Ofensivo ou Discriminatório**: Termos que promovam ódio, violência, discriminação, assédio ou linguagem inapropriada.\\n3️⃣ **Termos Ambíguos ou Enganosos**: Atividades que possam ter múltiplos significados, incluindo um contexto ilegal ou inadequado (exemplo: \\"aviãozinho\\").\\n4️⃣ **Serviços Sexuais ou Conteúdo Adulto**: Qualquer atividade que envolva prostituição, acompanhantes, massagens sensuais ou conteúdo erótico.\\n5️⃣ **Auto-Promoção Indevida**: Palavras que caracterizem marketing abusivo, como \\"melhor da cidade\\", \\"garantia de satisfação\\", \\"único oficial\\".\\n\\nSe a atividade não se enquadrar em nenhuma das categorias acima, ela deve ser **APROVADA** (responda apenas com \`APPROVED\`).\\n\\n### 📌 **Formato da Resposta**  \\nResponda **APENAS** com:  \\n- \`APPROVED\` (se a atividade for permitida).  \\n- \`DISAPPROVED\` (se a atividade violar alguma regra).  \\n\\n**Não adicione explicações, formatações ou caracteres extras na resposta.**"
    },
    {
      "role": "user",
      "content": "A seguinte atividade foi cadastrada: \\"${escapeStringForJson(activityName)}\\"."
    }
  ],
  "model": "gpt-4o-mini",
  "temperature": 0.3
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createChatCompletion',
      apiUrl: '${baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? messagecontent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

/// End OpenAI API Group Code

class TwilioWhatsAppCodeTesteCall {
  static Future<ApiCallResponse> call({
    String? code = '{\"1\":\"565678\"}',
    String? phone = '989089898098',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Twilio WhatsApp Code Teste',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts/ACa499f2fbeaa4989ec924b8fd6f490b6b/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic QUNhNDk5ZjJmYmVhYTQ5ODllYzkyNGI4ZmQ2ZjQ5MGI2YjpmMzM0MDE0MWVlOTQyZTQwYjU3YjQ1MDgzZGYyNDY0Mw==',
      },
      params: {
        'To': phone,
        'From': "whatsapp:+14155238886",
        'ContentVariables': code,
        'ContentSid': "HX60f58db77b78cce70c165422ba645853",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TwilioWhatsAppCodeProducaoCall {
  static Future<ApiCallResponse> call({
    String? phone = '989089898098',
    String? code = '{\"1\":\"565678\"}',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Twilio WhatsApp Code Producao',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts/ACa499f2fbeaa4989ec924b8fd6f490b6b/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic QUNhNDk5ZjJmYmVhYTQ5ODllYzkyNGI4ZmQ2ZjQ5MGI2YjpmMzM0MDE0MWVlOTQyZTQwYjU3YjQ1MDgzZGYyNDY0Mw==',
      },
      params: {
        'To': phone,
        'From': "whatsapp:+19034887132",
        'ContentSid': "HX60f58db77b78cce70c165422ba645853",
        'ContentVariables': code,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
