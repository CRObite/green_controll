import 'package:flutter/material.dart';
import 'package:green_control/util/AppColors.dart';

class CurrentParameters extends StatefulWidget {
  const CurrentParameters({super.key});

  @override
  State<CurrentParameters> createState() => _CurrentParametersState();
}

class _CurrentParametersState extends State<CurrentParameters> {

  List<String> parameters = ['Temperature','Humadity','Humadity'];
  List<String> value = ['39.5 °C','88%','800 ppm'];
  List<bool> isCorrect = [true,false,false];
  List<String> result = [
    '',
    'The temperature must be below or equal to 36,6',
    'The temperature must be below or equal to 70%',];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: parameters.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(parameters[index], style: const TextStyle(fontSize: 16),),
                        Text(value[index], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    !isCorrect[index]  ? Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          )
                      ),
                      child: const Center(child: Text('!',style: TextStyle(color: Colors.white,fontSize: 16),),),
                    ): Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          )
                      ),
                      child: const Center(child: Icon(Icons.check_outlined, color: Colors.white,),),
                    ),
                  ],
                ),
              ),
            ),

            if(!isCorrect[index])
              Text(result[index], style: TextStyle(fontSize: 16,color: AppColors.greenColor),)
          ],
        );
      },
    );
  }
}
