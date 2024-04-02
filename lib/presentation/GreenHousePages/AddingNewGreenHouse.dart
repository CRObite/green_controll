import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/presentation/Widgets/LongTextField.dart';
import 'package:green_control/util/AppColors.dart';

class AddingNewGreenHouse extends StatefulWidget {
  const AddingNewGreenHouse({super.key});

  @override
  State<AddingNewGreenHouse> createState() => _AddingNewGreenHouseState();
}

class _AddingNewGreenHouseState extends State<AddingNewGreenHouse> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sensorController = TextEditingController();
  final TextEditingController _plantController = TextEditingController();
  String? _selectedItem;


  @override
  void dispose() {
    _nameController.dispose();
    _sensorController.dispose();
    _plantController.dispose();
    super.dispose();
  }


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
        title: Text('Add GreenHouse', style:
          GoogleFonts.ribeyeMarrow(
              textStyle:  TextStyle(fontSize: 32)
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HalfRoundedContainer(title: 'Green House Name', color: AppColors.greenColor, textColor: Colors.white,),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LongTextField(
                  type: TextInputType.text,
                  hintText: 'New GH Name',
                  controller: _nameController,
              ),
            ),
            const SizedBox(height: 8,),
            HalfRoundedContainer(title: 'Set green house sensor',  color: AppColors.greenColor, textColor: Colors.white,),
            const SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color:AppColors.greyColor,width: 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButton<String>(
                  value: _selectedItem,
                  underline: SizedBox(),
                  hint: Text('Select Arduino'),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 8,),
            HalfRoundedContainer(title: 'Set  plants',  color: AppColors.greenColor, textColor: Colors.white,),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border: Border.all(color:AppColors.greyColor,width: 1),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: DropdownButton<String>(
                  value: _selectedItem,
                  underline: SizedBox(),
                  hint: Text('Select Arduino'),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: AppColors.greenColor,
        child: const Icon(Icons.arrow_forward, color: Colors.white,size: 50,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
