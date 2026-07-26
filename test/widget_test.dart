import 'package:flutter_test/flutter_test.dart';

import 'package:thais_renan/app.dart';

void main() {
  testWidgets('Home shows couple names and navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const WeddingApp());

    expect(find.text('Thaís'), findsOneWidget);
    expect(find.text('Renan'), findsOneWidget);
    expect(find.text('Detalhes'), findsOneWidget);
  });
}
