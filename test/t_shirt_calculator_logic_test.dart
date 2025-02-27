import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/cat/bemen3/m7/camera/business/t_shirt_calculator_logic.dart';

void main() {
  group('TShirtCalculatorLogic', () {
    
    test('calculaPreuSamarretes - preu sense descompte', () {
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(10, 'small'), 79.0);
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(10, 'medium'), 83.0);
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(10, 'large'), 127.0);
    });

    test('calculaDescompte - sense descompte', () {
      expect(TShirtCalculatorLogic.calculaDescompte(100.0, 'sense'), 0.0);
    });

    test('calculaDescompte - descompte 10%', () {
      expect(TShirtCalculatorLogic.calculaDescompte(100.0, '10%'), 10.0);
    });

    test('calculaDescompte - descompte 20€ (aplicable)', () {
      expect(TShirtCalculatorLogic.calculaDescompte(120.0, '20€'), 20.0);
    });

    test('calculaDescompte - descompte 20€ (no aplicable)', () {
      expect(TShirtCalculatorLogic.calculaDescompte(80.0, '20€'), 0.0);
    });

    test('preuDefinitiu - combina preu i descompte', () {
      // Sense descompte
      expect(TShirtCalculatorLogic.preuDefinitiu(10, 'small', 'sense'), 79.0);

      // Amb 10% de descompte
      expect(TShirtCalculatorLogic.preuDefinitiu(10, 'small', '10%'), 71.1);

      // Amb descompte de 20€
      expect(TShirtCalculatorLogic.preuDefinitiu(10, 'large', '20€'), 107.0);

      // Sense descompte perquè no supera 100€
      expect(TShirtCalculatorLogic.preuDefinitiu(5, 'small', '20€'), 39.5);
    });
  });
}
