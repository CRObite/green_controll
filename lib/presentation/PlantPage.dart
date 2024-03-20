import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/box_shadow.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.7/2),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.7/2),
                      ),
                    boxShadow: appShadow,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('Onion',
                          style: GoogleFonts.ribeyeMarrow(
                            textStyle:  TextStyle(
                                color: Colors.white,
                                fontSize: 32
                            ),
                          )
                      ),

                      SizedBox(height: 16,),

                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.25,
                        backgroundImage: AssetImage('assets/Plants/onion.jpg'),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            SizedBox(height: 16,),


            Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,

                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2,
                children: [
                  gridItem('Optimal Temperature', '21-27 °C'),
                  gridItem('Optimal Humidity', '60-70 %'),
                  gridItem('Optimal Lighting ', '10,000 - 20,000'),
                  gridItem('Optimal CO2 Level', '1000-1200 ppm'),
                ],
              ),
            ),


            SizedBox(height: 16,),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: appShadow,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Maintain a stable temperature and humidity in the greenhouse to prevent the development of diseases.  Trim the side shoots regularly to stimulate fruit growth. Ensure adequate watering, avoiding waterlogging of the soil.'
                ),
              ),
            )


          ],
        ),
      )
    );
  }


  Widget gridItem(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: appShadow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle,
          style: TextStyle(color: AppColors.blueColor),
        ),
      ),
    );
  }
}
