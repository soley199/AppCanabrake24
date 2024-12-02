import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CanaProviders extends ChangeNotifier {
  String _baseUrl = 'apicatalogo.canabrake.com';

  List<dynamic> distribuidoes = [];
  List<dynamic> linasProductos = [];
  List<dynamic> marcaModelo = [];

  CanaProviders(){
    getDistribuidores();
    getLineasProductos();
    getMarcaModelo();
  }

  Future<String> _getJsonData(String endpoint) async{
    final url =Uri.http(_baseUrl,'api/$endpoint');
    final response = await http.get(url);
    return response.body;

  }

  getMarcaModelo() async{
    final jsonData = await _getJsonData('modelo');
    final List<dynamic> decodeData = json.decode(jsonData);
    marcaModelo = decodeData;
    notifyListeners();
  }

  getDistribuidores() async{
    final jsonData = await _getJsonData('distribuidores');
    final List<dynamic> decodeData = json.decode(jsonData);
    distribuidoes = decodeData;
    notifyListeners();

  }

  getLineasProductos() async{
    
    final jsonData = await _getJsonData('lineaproducto');
    final List<dynamic> decodeData = json.decode(jsonData);
    linasProductos = decodeData;
    notifyListeners();

  }

   Future <List<dynamic>> getSearchCatalogo(String search) async{
    final url = Uri.http(_baseUrl,'api/vehiculo/$search');

    final response = await http.get(url);

    final List<dynamic> newsOnSerach = json.decode(response.body);
    //print('--$newsOnSerach');
    // searchcatalogo = newsOnSerach;
    return newsOnSerach;
  }

   Future <List<dynamic>> getSearchVehiculo(String search) async{
    final url = Uri.http(_baseUrl,'api/listvehiculo/$search');

    final response = await http.get(url);

    final List<dynamic> newsOnSerach = json.decode(response.body);
    //print('--$newsOnSerach');
    // searchcatalogo = newsOnSerach;
    return newsOnSerach;
  }
}   
