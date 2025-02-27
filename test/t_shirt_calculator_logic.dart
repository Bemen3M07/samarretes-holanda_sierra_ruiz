class TShirtCalculatorLogic {
  static const double small = 7.9;
  static const double medium = 8.5;
  static const double large = 13.0;

  static double calculaPreuSamarretes(int numero, String talla) {
    double preuUnitari = 0.0;
    switch (talla) {
      case 'small':
        preuUnitari = small;
        break;
      case 'medium':
        preuUnitari = medium;
        break;
      case 'large':
        preuUnitari = large;
        break;
      default:
        throw ArgumentError('Talla no vàlida');
    }
    return preuUnitari * numero;
  }

  static double calculaDescompte(double preu, String tipusDescompte) {
    if (tipusDescompte == '10%') {
      return preu * 0.10;
    } else if (tipusDescompte == '20€' && preu > 100) {
      return 20.0;
    }
    return 0.0;
  }

  static double preuDefinitiu(int numero, String talla, String tipusDescompte) {
    double preuSenseDescompte = calculaPreuSamarretes(numero, talla);
    double descompte = calculaDescompte(preuSenseDescompte, tipusDescompte);
    return preuSenseDescompte - descompte;
  }
}
