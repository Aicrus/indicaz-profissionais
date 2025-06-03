import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String formataPhoneSupabase(String phone) {
  // Remove todos os caracteres que não são dígitos
  String cleanPhone = phone.replaceAll(RegExp(r'\D'), '');

  // Verifica se o telefone está no formato de celular brasileiro (com 10 ou 11 dígitos)
  // 10 dígitos: telefone fixo (DDD + 8 dígitos)
  // 11 dígitos: celular (DDD + 9 dígitos)
  if (cleanPhone.length == 10 || cleanPhone.length == 11) {
    // Adiciona o prefixo 55 (Brasil)
    return '55$cleanPhone';
  }

  // Se já tiver o prefixo ou outro formato, retorna como está
  return cleanPhone;
}

String formataPhoneAPI(String phone) {
  // Remove todos os caracteres não numéricos
  String cleaned = phone.replaceAll(RegExp(r'\D'), '');

  // Verifica se o número começa com 55 e tem o comprimento adequado
  if (cleaned.startsWith('55')) {
    // Para números brasileiros com 13 dígitos (formato com o 9), remova o 9 após o DDD
    if (cleaned.length == 13) {
      // Formato: 55 + DDD(2) + 9 + número(8)
      // Resultado: 55 + DDD(2) + número(8)
      return '+' + cleaned.substring(0, 4) + cleaned.substring(5);
    }
    // Para números que já estão no formato correto (12 dígitos)
    else if (cleaned.length == 12) {
      return '+' + cleaned;
    }
  }

  // Se o formato não for reconhecido, retorna o número limpo com '+'
  if (cleaned.isNotEmpty) {
    return '+' + cleaned;
  }

  return ''; // Retorna string vazia se não houver dígitos
}

bool validatePassword(String? pass) {
  // preciso ter 8 caracteres true menos false
  if (pass == null) return false; // Check if pass is null
  return pass.length >= 8; // Check if pass has at least 8 characters
}

String iniciaisName(String nome) {
  // Remove espaços extras
  nome = nome.trim();

  // Se a string estiver vazia, retorna uma string vazia
  if (nome.isEmpty) return '';

  // Divide a string em palavras
  List<String> partes =
      nome.split(RegExp(r'\s+')); // Remove espaços extras corretamente

  // Cria uma lista para armazenar as iniciais
  List<String> iniciais = [];

  // Para cada parte, pega a primeira letra e a adiciona à lista de iniciais
  for (var parte in partes) {
    if (parte.isNotEmpty) {
      iniciais.add(parte[0].toUpperCase());
    }
  }

  // Se há pelo menos duas palavras, retorna as duas primeiras iniciais
  if (iniciais.length >= 2) {
    return iniciais.take(2).join('');
  }

  // Se há apenas uma letra, retorna essa letra maiúscula
  if (partes[0].length == 1) {
    return partes[0].toUpperCase();
  }

  // Se há apenas um nome completo, retorna as duas primeiras letras
  return partes[0].substring(0, 2).toUpperCase();
}

String? telefoneSemCaracteres(String? numero) {
  // preciso que retire os parenteses dos numeros exmplo (11)98604-4272 quero que retorne assim : 11986044272
  if (numero == null) return null;
  return numero.replaceAll(RegExp(r'[()\- ]'), '');
}

String extractStreetAndNumber(String fullAddress) {
  final parts = fullAddress.split(' - ');
  if (parts.isNotEmpty) {
    return parts.first.trim();
  }
  return fullAddress;
}

bool proibidas(String texto) {
  List<String> palavrasProibidas = ['palavroes', 'nudez', 'imoralidade'];
  final textoLower = texto.toLowerCase();

  for (String palavra in palavrasProibidas) {
    if (textoLower.contains(palavra)) {
      return true;
    }
  }

  return false;
}

bool palavrasProibidas(String texto) {
// Lista de palavras proibidas
  List<String> palavrasProibidas = [
    // Palavrões e xingamentos
    'puta', 'caralho', 'porra', 'merda', 'bosta', 'fdp', 'filho da puta',
    'desgraça',
    'cu', 'arrombado', 'viado', 'bicha', 'piranha', 'vagabunda',
    'puta que pariu',
    'foda', 'fodido', 'imbecil', 'otario', 'burro', 'animal', 'escroto',
    'corno',
    'corna', 'babaca', 'canalha', 'cuzao', 'palhaco', 'bostinha', 'merdinha',
    'nojento', 'nojenta', 'retardado', 'mongol', 'zé ruela', 'carnica', 'lixo',
    'vadia',

    // Nudez e sexual
    'sexo', 'sexual', 'pelado', 'pelada', 'nude', 'nudes', 'nudismo', 'porno',
    'pornô', 'pornografia', 'boquete', 'chupada', 'chupeta', 'gozar', 'gozo',
    'gozada', 'trepar', 'foder', 'fode', 'foda-se', 'pau', 'rola', 'buceta',
    'xereca', 'xota', 'pinto', 'piru', 'mamando', 'mamada', 'tesao', 'tesão',
    'orgasmo', 'punheta', 'siririca', 'safado', 'safada', 'tarado', 'tarada',
    'perverso', 'pervertido', 'pornosite', 'sexo anal', 'sexo oral', 'vibrador',

    // Drogas e ilícitos
    'maconha', 'baseado', 'erva', 'beck', 'cocaína', 'coca', 'crack', 'heroína',
    'metanfetamina', 'ácido', 'lsd', 'mdma', 'ecstasy', 'droga', 'drogas',
    'cheirar', 'cheirando', 'fumando', 'injetar', 'trafico', 'traficante',
    'boca de fumo', 'maconheiro', 'craqueiro', 'viciado', 'narco', 'pó',
    'linha',
    'erva daninha', 'fumacê', 'pedra', 'bagulho', 'skunk', 'haxixe',

    // Crimes e violência
    'assassinato', 'assassino', 'estuprador', 'estuprar', 'estupro',
    'pedofilia',
    'pedófilo', 'crime', 'criminoso', 'homicídio', 'matar', 'morte',
    'esfaquear',
    'armado', 'arma', 'arma de fogo', 'facada', 'tiro', 'tiroteio', 'bala',
    'assalto', 'assaltante', 'sequestro', 'sequestrar', 'contrabando',
    'corrupção',
    'fraude', 'explosivo', 'atentado', 'terrorismo',

    // Preconceito e ódio
    'preto imundo', 'macaco', 'crioulo', 'racista', 'traveco', 'gordo imundo',
    'aleijado', 'mongolóide', 'lésbica nojenta', 'viado', 'bicha',
    'transexual nojento',

    // Agressões e ameaças
    'odeio você', 'morre', 'vai morrer', 'tomara que morra', 'vou te matar',
    'quero te matar', 'maldito', 'maldita', 'maldição', 'explodir você'
  ];

  // Verifica se o texto contém alguma palavra proibida
  for (String palavra in palavrasProibidas) {
    if (texto.toLowerCase().contains(palavra)) {
      return true; // Palavra proibida encontrada
    }
  }
  return false; // Nenhuma palavra proibida encontrada
}

String removeMais55(String textfield) {
  // Remove todos os caracteres não numéricos para processamento
  String justDigits = textfield.replaceAll(RegExp(r'\D'), '');

  // Se tiver mais de 11 dígitos e começar com 55, remove o 55
  if (justDigits.length > 11 && justDigits.startsWith('55')) {
    justDigits = justDigits.substring(2);
  }

  // Limita a 11 dígitos se for maior
  if (justDigits.length > 11) {
    justDigits = justDigits.substring(0, 11);
  }

  // Aplica a formatação progressiva
  String formattedNumber = '';

  if (justDigits.length > 0) {
    // Adiciona DDD com parênteses
    if (justDigits.length >= 2) {
      formattedNumber = "(${justDigits.substring(0, 2)})";

      // Adiciona os próximos dígitos
      if (justDigits.length > 2) {
        int remainingLength = justDigits.length - 2;
        int digitsToAdd = remainingLength > 5 ? 5 : remainingLength;
        formattedNumber += justDigits.substring(2, 2 + digitsToAdd);

        // Adiciona traço e os dígitos finais
        if (justDigits.length > 7) {
          formattedNumber += "-";
          if (justDigits.length > 7) {
            formattedNumber += justDigits.substring(7);
          }
        }
      }
    } else {
      // Menos de 2 dígitos, retorna os dígitos originais
      formattedNumber = justDigits;
    }
  } else {
    // String vazia, retorna como está
    return textfield;
  }

  return formattedNumber;
}

String getGptResponse(dynamic gptResponse) {
  return gptResponse["choices"][0]["message"]["content"].trim();
}

bool textoIgual(
  String texto1,
  String texto2,
) {
  // se os texto9 forem iguai true ou false tipo isso Pintor e pintor mesmo sendo minusculos ou comecando com maiscula veja se é igual
  return texto1.toLowerCase() == texto2.toLowerCase();
}

String validarEndereco(String endereco) {
  // Se o endereço estiver vazio ou for nulo
  if (endereco == null || endereco.isEmpty) {
    return "Selecione um endereço.";
  }

  // Verifica se contém coordenadas padrão (0 ou 0.0) ou erros de digitação comuns
  if (endereco.contains(RegExp(
      r'LatLng\(lat:\s*0+(\.0+)?\s*,\s*(lng|Ing):\s*0+(\.0+)?\s*\)',
      caseSensitive: false))) {
    return "Selecione um endereço.";
  }

  // Regex para validar o formato completo do endereço
  final regex = RegExp(
      r'^(.*),\s*(\d+)\s*-\s*(.*),\s*(.*)\s*-\s*(\w{2})\s*,\s*(\d{5}-\d{3})\s*,\s*(.*)\s*LatLng\(lat:\s*(-?\d+\.\d+),\s*lng:\s*(-?\d+\.\d+)\)$');

  // Verifica se o endereço corresponde ao padrão completo
  final match = regex.firstMatch(endereco);

  if (match != null) {
    // Extrai apenas a parte do endereço sem as coordenadas
    return "${match.group(1)}, ${match.group(2)} - ${match.group(3)}, ${match.group(4)} - ${match.group(5)}, ${match.group(6)}, ${match.group(7)}";
  } else {
    // Se não corresponder ao padrão, retorna mensagem de erro
    return "Endereço incompleto. Por favor, selecione um endereço válido contendo: Rua, número, bairro, cidade, estado.";
  }
}

bool compararMinuscula(
  String? texto1,
  String? texto2,
) {
  // Preciso que a função continue como está, comparando se os textos são iguais após deixá-los em minúsculo. Mas, antes disso, se um dos textos não vier (texto 1, texto 2 ou ambos), o resultado deve ser falso. A conversão para minúsculo é necessária para evitar erro na comparação, já que um texto pode vir em maiúsculo e outro em minúsculo. Então, primeiro transforma em minúsculo e depois compara. Se forem iguais, retorna verdadeiro.
// Verifica se algum dos textos é nulo
  if (texto1 == null || texto2 == null) {
    return false;
  }

  // Compara os textos após convertê-los para minúsculo
  return texto1.toLowerCase() == texto2.toLowerCase();
}
