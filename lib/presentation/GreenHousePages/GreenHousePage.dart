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
                      hint: const Text('Plants'),
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


        ],
      ),
    );
  }
}
