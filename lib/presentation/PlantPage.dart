import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          title: Text('Plant Info', style:
            GoogleFonts.ribeyeMarrow(
              textStyle:  TextStyle(fontSize: 32)
            )
          ),
      ),
      body: Center(
        child: Text('sdsdfsdfsd'),
      ),
    );
  }
}
