import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/CustomShadow.dart';
import 'package:green_control/presentation/Widgets/LongTextField.dart';
import 'package:green_control/util/AppColors.dart';

class GreenHouse extends StatefulWidget {
  const GreenHouse({super.key});

  @override
  State<GreenHouse> createState() => _GreenHouseState();
}

class _GreenHouseState extends State<GreenHouse> {

  List<String> ghItems = ['Green House 1' ,'Green House 2', 'Green House 3'];
  List<String> ghPlantsItems = ['Tomatoes' ,'Onion', 'Cucumber'];
  final TextEditingController _editingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                Expanded(
                  child: LongTextField(
                      type: TextInputType.text,
                      hintText: 'Green House Name',
                      controller: _editingController
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 16,),

          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ghItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/gh_info');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background.jpg'),
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
                                  Text(ghItems[index],style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
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
                                        child: Text(ghPlantsItems[index],style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
