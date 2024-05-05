import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // register
  {
    'giwjdht1': {
      'en': 'Hey there,',
      'pt': 'Ei,',
    },
    'qwhxq8w2': {
      'en': 'Create an account',
      'pt': 'Crie a sua conta aqui',
    },
    '86xsl5ci': {
      'en': 'First Name',
      'pt': 'Primeiro nome',
    },
    'jivn9yel': {
      'en': 'Email',
      'pt': 'E-mail',
    },
    '4ebvfoor': {
      'en': 'Password',
      'pt': 'Senha',
    },
    '9pal95cq': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'dajvg3pe': {
      'en': 'Already have an account?',
      'pt': 'já tem uma conta?',
    },
    '33kwya5c': {
      'en': 'Login',
      'pt': 'Conecte-se',
    },
    'z6wjofta': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // completeProfile
  {
    'ofkpmbsl': {
      'en': 'Let’s complete your profile',
      'pt': 'Vamos completar seu perfil',
    },
    'y8n2azjt': {
      'en': 'It will help us to know more about you!',
      'pt': 'Isso nos ajudará a saber mais sobre você!',
    },
    'n7151moo': {
      'en': 'Age',
      'pt': 'Idade',
    },
    '65n010nr': {
      'en': 'Your weight',
      'pt': 'Seu peso',
    },
    'p2gedu9m': {
      'en': 'KG',
      'pt': 'KG',
    },
    't8lqubnq': {
      'en': 'Your height',
      'pt': 'Tua altura',
    },
    'hiinqm6l': {
      'en': 'CM',
      'pt': 'CM',
    },
    'u5gprayj': {
      'en': 'Já sofri de nefrite lúpica',
      'pt': 'Já sofri de nefrite lúpica',
    },
    '3zijivtd': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // login
  {
    'xeyjoblz': {
      'en': 'Hey there,',
      'pt': 'Ei,',
    },
    '1qfnh47f': {
      'en': 'Welcome Back',
      'pt': 'Bem vindo de volta',
    },
    'alxcxyoh': {
      'en': 'Email',
      'pt': 'E-mail',
    },
    'gpqgtgy2': {
      'en': 'Password',
      'pt': 'Senha',
    },
    '8r6an7xh': {
      'en': 'Forgot your password?',
      'pt': 'Esqueceu sua senha?',
    },
    'dtodyo4c': {
      'en': 'Don\'t have an account yet?',
      'pt': 'Não tem uma conta ainda?',
    },
    'mcbjpyt3': {
      'en': 'Register',
      'pt': 'Registro',
    },
    '4d2i0274': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // profile
  {
    'zpobou6g': {
      'en': 'Sign Up',
      'pt': 'Inscrever-se',
    },
    'b4uiygns': {
      'en': 'Height',
      'pt': 'Altura',
    },
    'gey1x5iy': {
      'en': 'Weight',
      'pt': 'Peso',
    },
    '921wwoob': {
      'en': 'Agee',
      'pt': 'Idade',
    },
    'l6sqtys6': {
      'en': 'Language',
      'pt': 'Linguagem',
    },
    'fnpug91n': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
  },
  // homeCopy
  {
    'sgj607ei': {
      'en': 'Bem vinda, Fulana',
      'pt': 'Bem vinda, Fulana',
    },
    'fx0bnd4f': {
      'en': 'Geral Health',
      'pt': 'Saúde Geral',
    },
    '67jxoqke': {
      'en': 'Muscle and joint',
      'pt': 'Músculo e articulação',
    },
    'a3msu34g': {
      'en': 'Skin and Mouth',
      'pt': 'Pele e Boca',
    },
    'np6jgajl': {
      'en': 'Head',
      'pt': 'Cabeça',
    },
    'u7mmh6k6': {
      'en': 'Breathing',
      'pt': 'Respirando',
    },
    'ch5yma60': {
      'en': 'Pee',
      'pt': 'Urina',
    },
    '8rguu8gr': {
      'en': 'Circulation Health',
      'pt': 'Saúde da Circulação',
    },
    'gpdxl3ml': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Recomendacoes
  {
    'o434nw7a': {
      'en': '💡 Baseado nos seus dados, temos algumas dicas',
      'pt': '💡 Com base em seus dados, temos algumas dicas',
    },
    'xl1ekwhs': {
      'en': 'Sua porcentagem é:',
      'pt': 'Sua porcentagem é:',
    },
    'bw56w1aw': {
      'en':
          'Essa é uma porcentagem baixa, mas temos algumas dicas para te ajudar',
      'pt':
          'Essa é uma porcentagem baixa, mas temos algumas dicas para te ajudar',
    },
    '0w0lu5d8': {
      'en': '20.1',
      'pt': '20.1',
    },
    'o0urs0v8': {
      'en': '🥗 Foods Recomendations',
      'pt': '🥗 Recomendações de alimentos',
    },
    'g5j50222': {
      'en':
          'Dieta balanceada: Priorize frutas, verduras, legumes, grãos integrais, proteínas magras e gorduras saudáveis.\n\nCálcio e Vitamina D: Consuma alimentos ricos em cálcio (lácteos, folhas verdes escuras) e vitamina D (peixes gordurosos, ovos) para fortalecer os ossos, especialmente se estiver em uso de corticoides. A suplementação pode ser necessária, conforme orientação médica.\n\nBaixo teor de sal: Reduza o consumo de sal para controlar a pressão arterial, principalmente se estiver em uso de corticoides.\n\nÔmega-3: Inclua fontes de ômega-3 (peixes gordurosos, sementes de chia e linhaça) para combater a inflamação.\n\nLimite o consumo de: Açúcar refinado, gorduras saturadas, alimentos processados e álcool.',
      'pt': '',
    },
    'n4ajni6j': {
      'en': '🏃‍♂️ Exercise Recomendations',
      'pt': '🏃‍♂️ Recomendações de exercícios',
    },
    'rx25nv84': {
      'en':
          'Exercícios aeróbicos regulares: Caminhada, ciclismo, natação, hidroginástica, dança, etc., por pelo menos 30 minutos, na maioria dos dias da semana.\n\nExercícios de fortalecimento muscular: Musculação, pilates, yoga, etc., 2 a 3 vezes por semana.\n\nAlongamento: Alongue-se diariamente para melhorar a flexibilidade e prevenir dores articulares.\n\nOuça seu corpo: Respeite seus limites e evite exercícios extenuantes durante as crises.',
      'pt': 'Recomendações Alimentares',
    },
    '0g0jyyij': {
      'en': 'Recomendações',
      'pt': 'Recomendações',
    },
    '5bu27i63': {
      'en': 'Recomendações',
      'pt': 'Recomendações',
    },
  },
  // CategoryCard
  {
    '043a026l': {
      'en': '😍 Option 1',
      'pt': '😍 Opção 1',
    },
    'o5k3z7s4': {
      'en': 'Option 2',
      'pt': 'opção 2',
    },
  },
  // Miscellaneous
  {
    'waxbtv41': {
      'en': 'Tailor your permissions message',
      'pt': 'Personalize sua mensagem de permissões',
    },
    '8swhravo': {
      'en': 'Tailor your permissions message',
      'pt': 'Personalize sua mensagem de permissões',
    },
    'reig6wqp': {
      'en': '',
      'pt': '',
    },
    'dra0fl3c': {
      'en': '',
      'pt': '',
    },
    'e9wjmwvk': {
      'en': '',
      'pt': '',
    },
    'ipye9nfx': {
      'en': '',
      'pt': '',
    },
    '9oonu6iv': {
      'en': '',
      'pt': '',
    },
    'h9xyhoq6': {
      'en': '',
      'pt': '',
    },
    '8ieyffzq': {
      'en': '',
      'pt': '',
    },
    'v4stvxqq': {
      'en': '',
      'pt': '',
    },
    'w5fbazhj': {
      'en': '',
      'pt': '',
    },
    'ag5ywrp5': {
      'en': '',
      'pt': '',
    },
    '13zq56gk': {
      'en': '',
      'pt': '',
    },
    'qhidckqr': {
      'en': '',
      'pt': '',
    },
    '9c7gpfmd': {
      'en': '',
      'pt': '',
    },
    'zrrdvahd': {
      'en': '',
      'pt': '',
    },
    '9e5bay4m': {
      'en': '',
      'pt': '',
    },
    '4penfff9': {
      'en': '',
      'pt': '',
    },
    'pip2lb7y': {
      'en': '',
      'pt': '',
    },
    'xasjkbkt': {
      'en': '',
      'pt': '',
    },
    '2ia92cvx': {
      'en': '',
      'pt': '',
    },
    '6h8mct3z': {
      'en': '',
      'pt': '',
    },
    'u9gjum4e': {
      'en': '',
      'pt': '',
    },
    'xogumqps': {
      'en': '',
      'pt': '',
    },
    'vw7pksqf': {
      'en': '',
      'pt': '',
    },
    'wznu638f': {
      'en': '',
      'pt': '',
    },
    'jdnzavzk': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
