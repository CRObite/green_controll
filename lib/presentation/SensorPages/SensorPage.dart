import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/CustomShadow.dart';
import 'package:green_control/presentation/Widgets/LongTextField.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {

  final TextEditingController _editingController = TextEditingController();
  List<String> sensorNames = ['Arduino 1', 'Arduino 2', 'Arduino 3'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LongTextField(
                type: TextInputType.text,
                hintText: 'Sensor Name',
                controller: _editingController
            ),
          ),
          const SizedBox(width: 16,),

          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sensorNames.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/sensor_info');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background2.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: CustomShadow.shadow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(sensorNames[index],style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 8,),
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('asdasdas',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      )
                                  ),
                                ],
                              ),
                            ),

                            Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)
                                          )
                                      ),
                                      child: IconButton(
                                        onPressed: (){},
                                        icon: const Icon(Icons.edit,color: Colors.black,),
                                      ),
                                    ),
                                    const SizedBox(height: 16,),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)
                                          )
                                      ),
                                      child: IconButton(
                                        onPressed: (){},
                                        icon: const Icon(Icons.delete,color: Colors.black,),
                                      ),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
