
import 'dart:io';

import 'package:app_cana_2024/providers/cana_providers.dart';
import 'package:flutter/material.dart';

import 'screens/screens.dart';

import 'package:provider/provider.dart';


void main(){
  HttpOverrides.global = new PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CanaProviders(), lazy: false,),
      ],
      child: MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CANABRAKE',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
        'distribuidores': ( _ ) => DistribuidoresScreen(),
        'lineaProducto' : ( _ ) => LineasProducto(),
        'marcaModelo' : (_) => MarcaModelo(),
        'vehiculo': (_) => Vehiculo(),
        'imgDetalles': (_) => ImgDetails(),
        
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xff1169B3)
        )
      ),
    );
  }
}

class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}