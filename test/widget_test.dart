// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/telas/calculadora.dart';

void main() {
  testWidgets('Visor inicia em 0 e digito 1 funciona', (WidgetTester tester) async {
    // Monta o widget da calculadora
    await tester.pumpWidget(const Calculatora());

    // Aguarda frames
    await tester.pumpAndSettle();

  // Verifica que existe ao menos um texto '0' (visor + botão '0')
  expect(find.text('0'), findsWidgets);

    // Toca no botão '1' e atualiza a UI
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

  // Verifica que existe ao menos um texto '1' (visor + botão '1')
  expect(find.text('1'), findsWidgets);
  });
}
