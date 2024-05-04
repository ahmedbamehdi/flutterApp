// pages/crud.dart
import 'dart:convert';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Crud {
  getRequest(String url) async {
    try {
      var responce = await http.get(Uri.parse(url));
      if (responce.statusCode == 200) {
        var responcebody = jsonDecode(responce.body);
        return responcebody;
      } else {
        print("Ereur ${responce.statusCode}");
      }
    } catch (e) {
      print("Ereur $e");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var responce = await http.post(Uri.parse(url), body: data);
      if (responce.statusCode == 200) {
        var responcebody = jsonDecode(responce.body);
        return responcebody;
      } else {
        print("Ereur ${responce.statusCode}");
      }
    } catch (e) {
      print("Ereur $e");
    }
  }
}

const ipadd = "10.9.18.11";
const port = "5001";
Future<String> insertData(String name, String email, String password,
    String latitude, String longitude) async {
  final response = await http.post(Uri.parse('http://$ipadd:$port/'), body: {
    'name': name.trim().toLowerCase(),
    'email': email.trim().toLowerCase(),
    'password': password.trim().toLowerCase(),
    'latitude': latitude.trim(),
    'longitude': longitude.trim()
  });
  if (response.statusCode == 200) {
    return "ok";
  } else {
    return "eroor";
  }
}