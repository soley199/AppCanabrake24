import 'package:app_cana_2024/search/searchCehiculo_delegate.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Vehiculo extends StatelessWidget {
  const Vehiculo({super.key});

  @override
  Widget build(BuildContext context) {

    final String model = ModalRoute.of(context)?.settings.arguments.toString() ?? 'acura';

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xff1169B3),
        title: Text('Catalogo',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: () => showSearch(context: context, delegate: VehiculoSearch()),
           icon: Icon(Icons.search_outlined, color: Colors.white,))
        ],
      ),
      body: Container(
        decoration:  const BoxDecoration(
          image:  DecorationImage(image:  AssetImage('assets/fondo.png'),
          fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Expanded(child: FutureBuilder(
              future: getvehiculoMarca(model), 
              builder: (BuildContext context, AsyncSnapshot  snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }else{
          final List<dynamic> searchvehiculo = snapshot.data!;
                    return ListView.builder(
                      itemCount: searchvehiculo.length,
                      itemBuilder: (BuildContext context, int index) { 
                        return Card(
                    //color: Color(0xff1169B3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.blue, width: 3),
                        ),
                    margin: EdgeInsets.only(top: 15,right: 10,left: 10),
                    elevation: 4,
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, 'details', arguments:searchvehiculo[index] ),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 13),
                               if(searchvehiculo[index]['marca'] != null)
                                Text('Marca: ${searchvehiculo[index]['marca']}',
                                style: TextStyle(fontSize: 23,color:Colors.black87,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                               if(searchvehiculo[index]['vehiculo'] != null)
                                Text('Vehiculo: ${searchvehiculo[index]['vehiculo']}',
                                style: TextStyle(fontSize: 23,color:Colors.black87,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                               if(searchvehiculo[index]['modelo'] != null)
                                Text('Modelo: ${searchvehiculo[index]['modelo']}',
                                style: TextStyle(fontSize: 18,color:Colors.black87,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('Delantera',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      child: Text('Trasera ',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                  ),
                                  SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text('${searchvehiculo[index]['delantera']}',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      child: Text('${searchvehiculo[index]['trasera']}',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                  ),
                                SizedBox(height: 13),
                              ],
                                    ),
                          ),
                        ),
                              ),
                            );
                            },);
                  }
                },
              ))
          ],
        ),
      ),
    );
  }
}


String _baseUrl = 'apicatalogo.canabrake.com';
Future <List<dynamic>> getvehiculoMarca(String data) async{
  final url = Uri.http(_baseUrl,'api/getvehiculo/$data');

    final response = await http.get(url);

    final List<dynamic> newsOnSerach = json.decode(response.body);
    //print('--$newsOnSerach');
    // searchcatalogo = newsOnSerach;
    return newsOnSerach;
  }