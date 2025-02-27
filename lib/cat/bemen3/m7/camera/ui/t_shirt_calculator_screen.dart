
import 'package:flutter/material.dart';
import '../business/t_shirt_calculator_logic.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  State<TShirtCalculatorScreen> createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  int? _numTShirts;
  String? _size;
  String? _offer;
  double _price = 0.0;

  void _calculatePrice() {
    if (_numTShirts == null || _size == null) {
      setState(() {
        _price = 0.0;
      });
      return;
    }

    setState(() {
      _price = TShirtCalculatorLogic.preuDefinitiu(
        _numTShirts!,
        _size!,
        _offer ?? '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Samarretes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Número de samarretes'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numTShirts = int.tryParse(value);
                  _calculatePrice();
                });
              },
            ),
            const Text('Talla'),
            for (var size in ['small', 'medium', 'large'])
              RadioListTile(
                title: Text(size),
                value: size,
                groupValue: _size,
                onChanged: (value) {
                  setState(() {
                    _size = value;
                    _calculatePrice();
                  });
                },
              ),
            const Text('Oferta'),
            DropdownButton<String>(
              value: _offer,
              items: [
                const DropdownMenuItem(value: '', child: Text('Sense descompte')),
                const DropdownMenuItem(value: '10%', child: Text('Descompte del 10%')),
                const DropdownMenuItem(value: '20€', child: Text('Descompte per quantitat')),
              ],
              onChanged: (value) {
                setState(() {
                  _offer = value;
                  _calculatePrice();
                });
              },
            ),
            const SizedBox(height: 20),
            Text('Preu: $_price €', style: const TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
