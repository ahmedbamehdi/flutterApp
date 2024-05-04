// pages/login.dart


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class FireLogin extends StatefulWidget {

  @override
  State<FireLogin> createState() => _FireLoginState();
}

class _FireLoginState extends State<FireLogin> {
  @override

  // ignore: override_on_non_overriding_member
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  // ignore: unused_field
  late String _password;

  Future<void> _submitForm() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'mail'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez saisir une adresse e-mail.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Le mot de passe doit comporter au moins 5 caractères.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 20.0),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        child: Text('Connexion'),
                        onPressed: _submitForm,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
