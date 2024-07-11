// ignore_for_file: constant_identifier_names

//Language enum

enum Language {
  English,
  Asante,
  Akuapem,
  Ewe,
  Hausa,
}

/// convert a string to Language enum
Language getLanguage(String language) {
  switch (language) {
    case 'English':
      return Language.English;
    case 'Asante':
      return Language.Asante;
    case 'Akuapem':
      return Language.Akuapem;
    case 'Ewe':
      return Language.Ewe;
    case 'Hausa':
      return Language.Hausa;
    default:
      return Language.English;
  }
}
