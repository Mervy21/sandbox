import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox/main.dart';
import 'package:sandbox/form_validator.dart';

void main(){
  group('tester le nom', (){
    test('tester si on a saisie le nom',() {
      final result = FormValidators.validateNom('');
      expect(result, 'Veuillez entrer votre nom');
    });
    test('Retourner null si le nom est valide', (){
      final result = FormValidators.validateNom('Merveilles');
      expect(result, null);
    });
  });
  group('tester le prenom', (){
    test('tester si on a saisie le prenom',() {
      final result = FormValidators.validatePrenom('');
      expect(result, 'Veuillez entrer votre prenom');
    });
    test('Retourner null si le prenom est valide', (){
      final result = FormValidators.validatePrenom('Diane');
      expect(result, null);
    });
  });
  group('tester lemail', (){
    test('tester si on a saisie lemail',() {
      final result = FormValidators.validateEmail('');
      expect(result, 'Veuillez entrer votre email');
    });
    test('Retourner null si lemail est valide', (){
      final result = FormValidators.validateEmail('merveillesdiana@gmail.com');
      expect(result, null);
    });
  });
  group('tester le motdepasse', (){
    test('tester si on a saisie le motdepasse',() {
      final result = FormValidators.validateMotDePasse('');
      expect(result, 'Veuillez entrer votre motdepasse');
    });
    test('Retourner null si le motdepasse est valide', (){
      final result = FormValidators.validateMotDePasse('eloise2202');
      expect(result, null);
    });
  });
}
