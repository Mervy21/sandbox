import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox/main.dart';
import 'package:sandbox/form_validator.dart';

void main() {
  testWidgets('Test email invalide', (WidgetTester tester) async {
    await tester.pumpWidget(const MyPage());

    await tester.enterText(find.widgetWithText(TextFormField, 'nom'), 'Durand');
    await tester.enterText(find.widgetWithText(TextFormField, 'prenom'), 'Jean');
    await tester.enterText(find.widgetWithText(TextFormField, 'email'), 'jean.email-invalide');
    await tester.enterText(find.widgetWithText(TextFormField, 'motdepasse'), 'motdepasse123');

    await tester.tap(find.text('Soumis'));
    await tester.pump();


    expect(find.text('Veuillez entrer un email valide'), findsOneWidget);
  });
  testWidgets('Test motdepasse trop court', (WidgetTester tester) async {
    await tester.pumpWidget(const MyPage());

    await tester.enterText(find.widgetWithText(TextFormField, 'nom'), 'Durand');
    await tester.enterText(find.widgetWithText(TextFormField, 'prenom'), 'Jean');
    await tester.enterText(find.widgetWithText(TextFormField, 'email'), 'jeandurand@email.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'motdepasse'), '123');

    await tester.tap(find.text('Soumis'));
    await tester.pump();

    expect(find.text('Le motdepasse doit contenir au moins 8 caracteres'), findsOneWidget);

  });
  testWidgets('Test nom non-saisie', (WidgetTester tester) async{
    await tester.pumpWidget(const MyPage());

    await tester.enterText(find.widgetWithText(TextFormField, 'nom'), '');
    await tester.enterText(find.widgetWithText(TextFormField, 'prenom'),'Diana');
    await tester.enterText(find.widgetWithText(TextFormField, 'email'),'merveillesdiana@gmail.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'motdepasse'),'eloise12345');


    await tester.tap(find.text('Soumis'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre nom'), findsOneWidget);
  });
  testWidgets('Test prenom non-saisie', (WidgetTester tester) async{
    await tester.pumpWidget(const MyPage());

    await tester.enterText(find.widgetWithText(TextFormField, 'nom'), 'Merveilles');
    await tester.enterText(find.widgetWithText(TextFormField, 'prenom'),'');
    await tester.enterText(find.widgetWithText(TextFormField, 'email'),'merveillesdiana@gmail.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'motdepasse'),'eloise12345');


    await tester.tap(find.text('Soumis'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre prenom'), findsOneWidget);
  });
  testWidgets('Test motdepasse non-saisie', (WidgetTester tester) async{
    await tester.pumpWidget(const MyPage());

    await tester.enterText(find.widgetWithText(TextFormField, 'nom'), 'Merveilles');
    await tester.enterText(find.widgetWithText(TextFormField, 'prenom'),'Diana');
    await tester.enterText(find.widgetWithText(TextFormField, 'email'),'merveillesdiana@gmail.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'motdepasse'),'');


    await tester.tap(find.text('Soumis'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre motdepasse'), findsOneWidget);
  });
  testWidgets('Test email non-saisie', (WidgetTester tester) async{
    await tester.pumpWidget(const MyPage());

    await tester.enterText(find.widgetWithText(TextFormField, 'nom'), 'Merveilles');
    await tester.enterText(find.widgetWithText(TextFormField, 'prenom'),'Diane');
    await tester.enterText(find.widgetWithText(TextFormField, 'email'),'');
    await tester.enterText(find.widgetWithText(TextFormField, 'motdepasse'),'eloise12345');


    await tester.tap(find.text('Soumis'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre email'), findsOneWidget);
  });
}