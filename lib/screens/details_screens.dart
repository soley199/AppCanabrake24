import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Map searchcatalogo = ModalRoute.of(context)!.settings.arguments as Map;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xff1169B3),
        title: Text(searchcatalogo['marca'], style: const TextStyle( color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration:  const BoxDecoration(
          image:  DecorationImage(image:  AssetImage('assets/fondo.png'),
          fit: BoxFit.cover)
        ),
        child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    if(searchcatalogo['dib'] != "")
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, 'imgDetalles',arguments:searchcatalogo['dib'] ),
                      child: Card(
                        color: Color(0xff1169B3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue, width: 3)),
                        margin: const EdgeInsets.all(15),
                        elevation: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Column(
                            children:[
                              const SizedBox(height: 10),
                              const Text('DELANTERA',
                              style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),

                              const SizedBox(height: 5),

                              Text('${searchcatalogo['delantera']}',
                              style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),
                              const SizedBox(height: 5),
                              Text(' ${searchcatalogo['vehiculo']}',
                              style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),
                              const SizedBox(height: 5),
                              Text('Modelo: ${searchcatalogo['modelo']}',
                              style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),
                              const SizedBox(height: 5),

                              FadeInImage(
                              placeholder: AssetImage('assets/load.gif'), 
                              image: NetworkImage('${searchcatalogo['dib']}'),
                              fit: BoxFit.contain,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text('${searchcatalogo['marca']}', 
                                  style: const TextStyle(fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    if(searchcatalogo['dib2'] != "")
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, 'imgDetalles',arguments:searchcatalogo['dib2'] ),
                      child: Card(
                        color: const Color(0xff1169B3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue, width: 3),),
                        margin: const EdgeInsets.all(15),
                        elevation: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Column(
                            children:[
                              const SizedBox(height: 10),
                              const Text('TRASERA',
                              style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),

                              const SizedBox(height: 5),

                              Text('${searchcatalogo['trasera']}',
                              style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),
                              const SizedBox(height: 5),
                              Text(' ${searchcatalogo['vehiculo']}',
                              style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),
                              const SizedBox(height: 5),
                              Text('Modelo: ${searchcatalogo['modelo']}',
                              style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500,), //Textstyle
                              ),
                              const SizedBox(height: 5),
                              FadeInImage(
                              placeholder: AssetImage('assets/load.gif'), 
                              image: NetworkImage('${searchcatalogo['dib2']}'),
                              fit: BoxFit.contain,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text('${searchcatalogo['marca']}', 
                                  style: const TextStyle(fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold), 
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
            ],
          )
      ),
      ),
    );
  }
}