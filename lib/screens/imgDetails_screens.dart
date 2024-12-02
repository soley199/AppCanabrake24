import 'package:flutter/material.dart';

class ImgDetails extends StatelessWidget {
  const ImgDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final String img = ModalRoute.of(context)?.settings.arguments.toString() ?? 'load.gif';
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: Container(
        decoration: const  BoxDecoration(
          image:  DecorationImage(image: AssetImage('assets/fondo.png'),
          fit: BoxFit.cover)
        ),
          child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            InteractiveViewer(
              child: FadeInImage(
                            placeholder: AssetImage('assets/load.gif'), 
                            image: NetworkImage(img),
                            fit: BoxFit.contain,
                            ),
            ),
          ],
              ),
        ),
      ),
    );
  }
}