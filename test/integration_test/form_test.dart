import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sandbox/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Remplir et soumettre le formulaire', (WidgetTester tester) async {
    // Lance l'app
    await tester.pumpWidget(MyPage());
    await tester.pumpAndSettle();

    // Remplir les champs
    await tester.enterText(find.byKey(const Key('nomField')), 'Durand');
    await tester.enterText(find.byKey(const Key('prenomField')), 'Jean');
    await tester.enterText(find.byKey(const Key('emailField')), 'jean@gmail.com');
    await tester.enterText(find.byKey(const Key('motdepasseField')), '12345678');

    // Appuyer sur le bouton
    await tester.tap(find.byKey(const Key('submitbutton')));
    await tester.pumpAndSettle();

    // Vérifie le message de succès
    expect(find.text('Formulaire soumis avec succès !'), findsOneWidget);
  });
}