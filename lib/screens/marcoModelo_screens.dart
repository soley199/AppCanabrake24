import 'package:app_cana_2024/providers/cana_providers.dart';
import 'package:app_cana_2024/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarcaModelo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final marcaModelo = Provider.of<CanaProviders>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xff1169B3),
        actions: <Widget>[
          TextButton(
            onPressed: () => showSearch(context: context, delegate: CatalogoSearchDelegate()),
            child: const Text('Buscar FMSI',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: Container(
        decoration:  const BoxDecoration(
          image:  DecorationImage(image:  AssetImage('assets/fondo.png'),
          fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                
                ),
                child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selecciona una Marca', style: TextStyle(fontSize: 28), ),              
            ],
          )
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: marcaModelo.marcaModelo.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListTile(
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue, width: 3),
                      ),
                      iconColor: Colors.red,
                      leading: const Icon(Icons.adjust_sharp),
                      title: Text('${marcaModelo.marcaModelo[index]['marca']}',style: TextStyle(fontSize: 20),),
                      onTap: () => Navigator.pushNamed(context, 'vehiculo', arguments:marcaModelo.marcaModelo[index]['marca'] ),
                      trailing: const Icon(
                        Icons.arrow_right_rounded,
                        size: 30,
                      ),
                    ),
                    
                  );
                })),
          ],
        ),
      ),
    );
  }
}