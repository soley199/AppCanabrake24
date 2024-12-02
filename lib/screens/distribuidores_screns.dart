
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_cana_2024/providers/cana_providers.dart';




class DistribuidoresScreen extends StatelessWidget {
  // const DistribuidoresScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final distribuidresProvider = Provider.of<CanaProviders>(context);

    // print(distribuidresProvider.distribuidoes);
   
    // final newsproducts = Provider.of<CanaProviders>(context);

     final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Distribuidores',style: TextStyle(color: Colors.white)),
        elevation: 0,
        centerTitle: true,
        ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fondo.png'),
          fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: distribuidresProvider.distribuidoes.length,
                itemBuilder: ( _ , int index) {
                  return Card(
                    //color: Color(0xff1169B3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue, width: 3),
                        ),
                    margin: const EdgeInsets.only(top: 15,right: 10,left: 10),
                    elevation: 4,
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: 
                                Text('${distribuidresProvider.distribuidoes[index]['distribuidor']}',
                                style: TextStyle(fontSize: 25,color:Colors.red[400],fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 2,
                              ),
                            ),
                            const SizedBox(height: 5),
                            if(distribuidresProvider.distribuidoes[index]['RefeEmpresa'] != null)
                              Text('${distribuidresProvider.distribuidoes[index]['RefeEmpresa']}',
                              style: const TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold),
                              ),
                              if(distribuidresProvider.distribuidoes[index]['Referencia'] != null)
                              Text('${distribuidresProvider.distribuidoes[index]['Referencia']}',
                              style: const TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold),
                              ),
                              if(distribuidresProvider.distribuidoes[index]['RefeSecu'] != null)
                              Text('${distribuidresProvider.distribuidoes[index]['RefeSecu']}',
                              style: const TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold),
                              ),
                            const SizedBox(height: 10),

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(thickness: 1.4),
                              ),
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('${distribuidresProvider.distribuidoes[index]['direccion']}',  
                            style: const TextStyle(fontSize: 18,color:Colors.black87,fontWeight: FontWeight.bold),
                            ),
                              ),

                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 20,),
                                const Icon(Icons.email, color: Colors.black87,),
                                const SizedBox(width: 5,),
                                Flexible(
                                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('${distribuidresProvider.distribuidoes[index]['RefeEmail']}',
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold),
                                  ),),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 20,),
                                const Icon(Icons.phone, color: Colors.black87,),
                                const SizedBox(width: 5,),
                                Flexible(
                                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('${distribuidresProvider.distribuidoes[index]['RefeNumero']}',
                                  style: const TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold)),
                                  ),
                                ),                              ],
                            ),
                            if(distribuidresProvider.distribuidoes[index]['RefeSecuEmail'] != null)
                              Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Icon(Icons.email, color: Colors.black87,),
                                  const SizedBox(width: 5,),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child:
                                    Text('${distribuidresProvider.distribuidoes[index]['RefeSecuEmail']}',
                                    maxLines: 2,
                                    style: const TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold),
                                    ),
                                    ),
                                  )
                                ],
                              ),
                            if(distribuidresProvider.distribuidoes[index]['RefeSecuNumero'] != null)
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.phone, color: Colors.black87,),
                                SizedBox(width: 5,),
                                Text('${distribuidresProvider.distribuidoes[index]['RefeSecuNumero']}',
                                style: TextStyle(fontSize: 15,color:Colors.black87,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                                ),
                              ),
                            );
                },
              ),)
          ],
        ),
        
      ),

    );
  }
}