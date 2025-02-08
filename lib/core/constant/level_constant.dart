class LevelConstant {
  static String begginer = 'Iniciante';
  static String intermediate = 'Intermediário';
  static String advanced = 'Avançado';

  static String getText(int level) {
    switch (level) {
      case 1:
        return begginer;
      case 2:
        return intermediate;
      case 3:
        return advanced;
      default:
        return '';
    }
  }
}
