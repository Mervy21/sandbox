import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sandbox/form_validator.dart';

void main() {
  runApp(const MyPage());
}
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Formulaire',
      debugShowCheckedModeBanner: false,
      home: Formulaire(),
    );
  }
}
class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formkey = GlobalKey<FormState>();
  String nom = '';
  String prenom = '';
  String email = '';
  String motdepasse = '';
  String successMessage = '';

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      final url = Uri.parse(
          'https://webhook.site/1bd561e4-c612-4477-9f40-547b3bcbe930');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nom': nom,
          'prenom': prenom,
          'email': email,
          'motdepasse': motdepasse,
        }),
      );
      print('Statut : ${response.statusCode}');
      print('Reponse : ${response.body}');
      setState(() {
        successMessage = 'Formulaire soumis avec succes';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Formulaire',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                key: const Key('nomField'),
                decoration: InputDecoration(labelText: 'nom'),
                validator: FormValidators.validateNom,
                onSaved: (value) => nom = value!,
              ),
              TextFormField(
                key: const Key('prenomField'),
                decoration: InputDecoration(labelText: 'prenom'),
                  validator: FormValidators.validatePrenom,
                onSaved: (value) => prenom = value!,

              ),
              TextFormField(
                key: const Key('emailField'),
                decoration: InputDecoration(labelText: 'email'),
                keyboardType: TextInputType.emailAddress,
                validator: FormValidators.validateEmail,
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                key: const Key('motdepasseField'),
                decoration:  const InputDecoration(labelText: 'motdepasse'),
                obscureText: true,
                validator: FormValidators.validateMotDePasse,
                onSaved: (value) => motdepasse = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                key: const Key('submitbutton'),
                onPressed: _submitForm,
                child: Text("Soumis"),
              ),
              if( successMessage.isNotEmpty)
                Text(
                  successMessage,
                  style: TextStyle(color: Colors.green),
                )
              ,
            ],
          ),
        ),
      ),
                )),
        )
    );

  }}