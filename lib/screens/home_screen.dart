import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(      
      body: PageView(
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: const [
          Page1(),
          Page2()

        ],
      ),

    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack( 
      children: [
        Background_Inicio(),
        
        mainContent()
      ],
      
    );
  }
}

class mainContent extends StatelessWidget {
  const mainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        const Icon(Icons.keyboard_arrow_down, size: 100,color: Colors.white,)
    
      ],
    );
  }
}

class Background_Inicio extends StatelessWidget {
  const Background_Inicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image:  DecorationImage(image: AssetImage('assets/home.png'),
        fit: BoxFit.cover)
      ),
      // child: const Image(image: AssetImage('assets/home.png'),)
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar( 
        title: const Text(''),
        elevation: 0,
      ),
      body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          image:  DecorationImage(image: AssetImage('assets/fondo.png'),
          fit: BoxFit.cover)
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image:  AssetImage("assets/cana.png"),
              height: 350,
            ),
          const SizedBox(height: 30,),
              ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, 'marcaModelo',arguments: 'new_instance'),
              icon: const Icon(Icons.menu_book_outlined, size: 50,color:Colors.white),
              label: const Text("Catalogo", style: TextStyle(fontSize: 25,color:Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1169B3),
                fixedSize: const Size(400, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              )
              ),
              const SizedBox(height: 20,),

              ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, 'lineaProducto',arguments: 'new_instance'),
              icon: const Icon(Icons.commute_sharp, size: 50,color:Colors.white),
              label: const Text("Líneas Producto", style: TextStyle(fontSize: 25,color:Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1169B3),
                fixedSize: const Size(400, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              )
              ),
              const SizedBox(height: 20,),

              ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, 'distribuidores',arguments: 'new_instance'),
              icon: const Icon(Icons.location_on_outlined, size: 50,color:Colors.white),
              label: const Text("Distribuidores",style: TextStyle(fontSize: 25,color:Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1169B3),
                fixedSize: const Size(400, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              )
              ),
              const SizedBox(height: 20,),
              
            //   ElevatedButton.icon(
            // onPressed: () {},
            //   icon: const Icon(Icons.settings_applications, size: 50,color:Colors.white),
            //   label: const Text("Política Privacidad",style: TextStyle(fontSize: 25,color:Colors.white)),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color(0xff1169B3),
            //     fixedSize: const Size(400, 50),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)
            //     )
            //   )
            //   ),
              const SizedBox(height: 15,),
              Expanded(child: Container( )),

          ],
        )
      ),
    ),
    );
  }
}