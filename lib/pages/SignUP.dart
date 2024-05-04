// pages/SignUP.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smart_car_parking/pages/crud.dart';
import 'package:smart_car_parking/pages/login.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String _email;
  late String _password;
  late String _name;
  late Position position;
  
  Future<void> _submitForm() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      try {
        
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        
        double latitude = position.latitude;
        double longitude = position.longitude;
        insertData(_name, _email, _password, latitude.toString(),
            longitude.toString());
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Succès'),
            content: Text('Vous êtes inscrit avec succès.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>  FireLogin(),
                  ));
                },
              )
            ],
          ),
        );
      } on FirebaseAuthException catch (error) {
        setState(() {
          _isLoading = false;
        });
        String errorMessage = ' conexion échoué';
        if (error.message != null) {
          errorMessage = error.message!;
        }
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Une erreur s'est produite"),
            content: Text(errorMessage),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S'inscrire"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Material(
                                elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
                      child: TextFormField(    
                                  decoration: InputDecoration(
                                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Nom",
                                  prefixIcon: Icon(Ionicons.person_outline),
                                ),
                        obscureText: true,
                    validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer un nom.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Material(
                                elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
                      child: TextFormField(    
                                  decoration: InputDecoration(
                                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "mail",
                                  prefixIcon: Icon(Ionicons.mail_outline),
                                ),
                        obscureText: true,
                        validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez saisir une adresse e-mail valide.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Material(
                                elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
                      child: TextFormField(    
                                  decoration: InputDecoration(
                                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Mot de passe",
                                  prefixIcon: Icon(Ionicons.lock_closed_outline),
                                ),
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
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton( 
                       
                        onPressed: _submitForm,
                        child: const Text("S'inscrire",
                        ), 
                        
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
