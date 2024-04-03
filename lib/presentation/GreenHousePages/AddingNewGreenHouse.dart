import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/domain/arduino/arduino.dart';
import 'package:green_control/domain/plants/plant.dart';
import 'package:green_control/presentation/GreenHousePages/adding_greenhouse_bloc/adding_greenhouse_bloc.dart';

import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/presentation/Widgets/LongTextField.dart';
import 'package:green_control/util/AppColors.dart';

class AddingNewGreenHouse extends StatefulWidget {
  const AddingNewGreenHouse({super.key});

  @override
  State<AddingNewGreenHouse> createState() => _AddingNewGreenHouseState();
}

class _AddingNewGreenHouseState extends State<AddingNewGreenHouse> {



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
      body: BlocProvider(
        create: (context) => AddingGreenhouseBloc(),
        child: AddingNewGreenHouseForm(),
      ),
    );
  }
}


class AddingNewGreenHouseForm extends StatefulWidget {
  const AddingNewGreenHouseForm({super.key});

  @override
  State<AddingNewGreenHouseForm> createState() => _AddingNewGreenHouseFormState();
}

class _AddingNewGreenHouseFormState extends State<AddingNewGreenHouseForm> {

  final TextEditingController _nameController = TextEditingController();
  Plant? _selectedPlant;
  Arduino? _selectedArduino;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<AddingGreenhouseBloc>(context).add(
      loadPlantAndArduinoData(),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<AddingGreenhouseBloc,AddingGreenhouseState>(
      listener: (context,state){
        if (state is AddingGreenhouseCrated) {
            Navigator.of(context).pushReplacementNamed('/app');
          }
        },
        child: BlocBuilder<AddingGreenhouseBloc,AddingGreenhouseState>(
              builder: (context,state){
                if(state is AddingGreenhouseSuccess){
                  return SingleChildScrollView(
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
                            child: DropdownButton<Arduino>(
                              value: _selectedArduino,
                              underline: SizedBox(),
                              hint: Text('Select Arduino'),
                              icon: Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              onChanged: (Arduino? newValue) {
                                setState(() {
                                  _selectedArduino = newValue;
                                });
                              },
                              items: state.arduino
                                  .map<DropdownMenuItem<Arduino>>((Arduino value) {
                                return DropdownMenuItem<Arduino>(
                                  value: value,
                                  child: Text('ARDUINO: ${value.id}'),
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
                            child: DropdownButton<Plant>(
                              value: _selectedPlant,
                              underline: SizedBox(),
                              hint: Text('Select Plant'),
                              icon: Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              onChanged: (Plant? newValue) {
                                setState(() {
                                  _selectedPlant = newValue;
                                });
                              },
                              items: state.plants
                                  .map<DropdownMenuItem<Plant>>((Plant value) {
                                return DropdownMenuItem<Plant>(
                                  value: value,
                                  child: Text(value.name ?? '???'),
                                );
                              }).toList(),
                            ),
                          ),
                        ),




                        SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AddingGreenhouseBloc>(context).add(
                                    crateButtonPressed(arduino: _selectedArduino, plant: _selectedPlant, name: _nameController.text)
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('Crate New Greenhouse', style: TextStyle(color: Colors.white),),
                              ),

                            ),
                          ],
                        )

                      ],
                    ),
                  );
                }else if(state is AddingGreenhouseLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if (state is AddingGreenhouseError) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }else {
                  return Container();
                }

              }
          ),
      );
    }
}
