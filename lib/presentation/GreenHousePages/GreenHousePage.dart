import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/LongTextField.dart';
import 'package:green_control/util/AppColors.dart';

class GreenHouse extends StatefulWidget {
  const GreenHouse({super.key});

  @override
  State<GreenHouse> createState() => _GreenHouseState();
}

class _GreenHouseState extends State<GreenHouse> {

  String? selectedValue;
  List<String> dropdownItems = ['All' ,'Onion', 'Carrot', 'Cucumber', 'Salad'];
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
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                    border: Border.all(color: AppColors.greyColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton<String>(
                      underline: Container(),
                      isExpanded: true,
                      hint: const Text('asdasda'),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 16,),

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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
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
