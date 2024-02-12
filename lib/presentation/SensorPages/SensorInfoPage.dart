import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/presentation/Widgets/CurrentParameters.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/util/AppColors.dart';

class SensorInfoPage extends StatefulWidget {
  const SensorInfoPage({super.key});

  @override
  State<SensorInfoPage> createState() => _SensorInfoPageState();
}

class _SensorInfoPageState extends State<SensorInfoPage> {
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
        title: Text('Sensor Info', style:
          GoogleFonts.ribeyeMarrow(
              textStyle:  TextStyle(fontSize: 32)
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HalfRoundedContainer(title: 'Arduino sensor 1', color: AppColors.greenColor, textColor: Colors.white,),
            const SizedBox(height: 8,),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text("Green House name:",style: TextStyle(fontSize: 16),),
                  SizedBox(width: 8,),
                  Text('Green House 1',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            const SizedBox(height: 16,),

            HalfRoundedContainer(title: 'Current Parameters', color: AppColors.greenColor, textColor: Colors.white,),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CurrentParameters(),
            ),
          ],
        ),
      ),
    );
  }
}
