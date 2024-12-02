import 'package:app_cana_2024/providers/cana_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LineasProducto extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final lineasProductoProvider = Provider.of<CanaProviders>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Lineas de Prodcuto',style: TextStyle(color: Colors.white)),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fondo.png'),
          fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: lineasProductoProvider.linasProductos.length,
                itemBuilder: ( _ , int index) {
                  return
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.blue,width: 3),),
                      margin: EdgeInsets.all(15),
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if(lineasProductoProvider.linasProductos[index]['img'] != null)
                            FadeInImage(
                              placeholder: AssetImage('assets/load.gif') , 
                              image: NetworkImage('${lineasProductoProvider.linasProductos[index]['img']}'),
                              fit: BoxFit.contain,
                            ),
                          if(lineasProductoProvider.linasProductos[index]['img2'] != null)
                            FadeInImage(
                              placeholder: AssetImage('assets/load.gif'), 
                              image: NetworkImage('${lineasProductoProvider.linasProductos[index]['img2']}'),
                              fit: BoxFit.contain,
                            ),
                          if(lineasProductoProvider.linasProductos[index]['descripcion'] != null)
                             Container(
                              padding: EdgeInsets.all(10),
                              child: Text('${lineasProductoProvider.linasProductos[index]['descripcion']}', style: TextStyle(fontSize: 20),),
                            )
                        ],
                    ),
                  ) 
                  ;
                },
              ),)
          ],
        ),
      ),
    );
  }
}