import 'package:app_cana_2024/providers/cana_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogoSearchDelegate extends SearchDelegate{
  @override

  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar por FMSI';

  

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        onPressed: ()=> query = '',
      icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, 
    icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  Widget _emtyContenido(){
    return const Center(
      child: Icon(Icons.disc_full_outlined, color: Colors.black38,size: 150,)
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _emtyContenido();
    }
   final seacrhprovider = Provider.of<CanaProviders>(context,);

   return FutureBuilder(
      future: seacrhprovider.getSearchCatalogo(query),
      builder: (_, AsyncSnapshot <List<dynamic>> snapshot){
        
       
        
        if(!snapshot.hasData) return _emtyContenido();

        final List<dynamic> searchcatalogo = snapshot.data!;

        // print(searchcatalogo);
        
        return ListView.builder(
          itemCount: searchcatalogo.length,
          itemBuilder: (BuildContext context, int index) {
            return  Card(
                    //color: Color(0xff1169B3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue, width: 3),
                        ),
                    margin: const EdgeInsets.only(top: 15,right: 10,left: 10),
                    elevation: 4,
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, 'details', arguments:searchcatalogo[index] ),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 13),
                               if(searchcatalogo[index]['marca'] != null)
                                Text('Marca: ${searchcatalogo[index]['marca']}', 
                                style: TextStyle(fontSize: 23,color:Colors.black87,fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                               if(searchcatalogo[index]['vehiculo'] != null)
                                Text('Vehiculo: ${searchcatalogo[index]['vehiculo']}', 
                                style: const TextStyle(fontSize: 23,color:Colors.black87,fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                               if(searchcatalogo[index]['modelo'] != null)
                                Text('Modelo: ${searchcatalogo[index]['modelo']}', 
                                style: const TextStyle(fontSize: 18,color:Colors.black87,fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                        
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Delantera',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                    Text('Trasera ',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                  ],
                                  ),
                                  const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${searchcatalogo[index]['delantera']}',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                    Text('${searchcatalogo[index]['trasera']}',style: TextStyle(color:Colors.black87,fontSize:18,fontWeight: FontWeight.bold),),
                                  ],
                                  ),
                                const SizedBox(height: 13),
                              ],
                                    ),
                          ),
                        ),
                              ),
                            );
          },
        );
      },
      );
  }

}