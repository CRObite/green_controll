import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/presentation/Widgets/CurrentParameters.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/util/AppColors.dart';

class GreenHouseInfo extends StatefulWidget {
  const GreenHouseInfo({super.key});

  @override
  State<GreenHouseInfo> createState() => _GreenHouseInfoState();
}

class _GreenHouseInfoState extends State<GreenHouseInfo> {




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
        title: Text('GreenHouse Info', style:
          GoogleFonts.ribeyeMarrow(
              textStyle:  TextStyle(fontSize: 32)
          )
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            HalfRoundedContainer(title: 'GreenHouse 1', color: AppColors.greenColor, textColor: Colors.white,),
            const SizedBox(height: 16,),
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('GreenHouse plants',style: TextStyle(fontSize: 16),),
                        SizedBox(height: 8,),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Tomatoes'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('GreenHouse sensor',style: TextStyle(fontSize: 16),),
                        SizedBox(height: 8,),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Arduino sensor 4 '),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16,),

            HalfRoundedContainer(
                title:'Current Parameters',
                color: AppColors.greenColor,
                textColor: Colors.white
            ),
            const SizedBox(height: 8,),

            const Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: CurrentParameters()
            ),



          ],
        ),
      ),
    );
  }
}
