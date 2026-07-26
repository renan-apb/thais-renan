import 'package:flutter_test/flutter_test.dart';

import 'package:thais_renan/app.dart';

void main() {
  testWidgets('Home shows couple names and navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const WeddingApp());

    expect(find.text('Thaís\n& Renan'), findsOneWidget);
    expect(find.text('DETALHES'), findsOneWidget);
    expect(
      find.text('10 de julho de 2027  ·  Nova Veneza - SC'),
      findsOneWidget,
    );
    expect(find.text('CONFIRMAR PRESENÇA'), findsOneWidget);
  });
}
