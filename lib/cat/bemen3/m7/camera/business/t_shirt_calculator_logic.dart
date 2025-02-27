
class TShirtCalculatorLogic {
  static const double small = 7.9;
  static const double medium = 8.3;
  static const double large = 12.7;

  static double calculaPreuSamarretes(int numero, String talla) {
    double preuUnitari;
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
        throw ArgumentError('Talla desconeguda');
    }
    return numero * preuUnitari;
  }

  static double calculaDescompte(double preu, String tipusDescompte) {
    if (tipusDescompte == '10%') {
      return preu * 0.1;
    } else if (tipusDescompte == '20€' && preu > 100) {
      return 20.0;
    } else {
      return 0.0;
    }
  }

  static double preuDefinitiu(int numero, String talla, String descompte) {
    double preuSenseDescompte = calculaPreuSamarretes(numero, talla);
    double descompteAplicat = calculaDescompte(preuSenseDescompte, descompte);
    return preuSenseDescompte - descompteAplicat;
  }
}
