import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/domain/arduino/arduino.dart';
import 'package:green_control/util/AppColors.dart';

import 'current_parameters_cubit/current_parameters_cubit.dart';

class CurrentParameters extends StatefulWidget {
  const CurrentParameters({Key? key, required this.arduinoId}) : super(key: key);

  final int arduinoId;

  @override
  State<CurrentParameters> createState() => _CurrentParametersState();
}

class _CurrentParametersState extends State<CurrentParameters> {
  late List<String> parameters;
  late Timer _timer;
  final currentParametersCubit = CurrentParametersCubit();

  @override
  void initState() {
    super.initState();
    parameters = ['Temperature', 'Air Humidity','Ground Humidity', 'Light', 'Carbon Dioxide'];

    currentParametersCubit.loadArduinoParameterData(widget.arduinoId);

    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      currentParametersCubit.loadArduinoParameterData(widget.arduinoId);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  bool _isParameterCorrect(int index, Arduino arduino) {
    switch (index) {
      case 0:
        return _isWithinRange(arduino.temperature,arduino.plant!.minimumTemperature, arduino.plant!.maximumTemperature);
      case 1:
        return _isWithinRange(arduino.humidityAir, arduino.plant!.minimumHumidityAir, arduino.plant!.maximumHumidityAir);
      case 2:
        return _isWithinRange(arduino.humidityGround, arduino.plant!.minimumHumidityGround, arduino.plant!.maximumHumidityGround);
      case 3:
        return _isWithinRange(arduino.light, arduino.plant!.minimumLight, arduino.plant!.maximumLight);
      case 4:
        return _isWithinRange(arduino.carbonDioxide, arduino.plant!.minimumCarbonDioxide, arduino.plant!.maximumCarbonDioxide);
      default:
        return false;
    }
  }

  String _getRecommendations(int index, Arduino arduino) {
    switch (index) {
      case 0:
        return 'The temperature should be in the range of ${arduino.plant!.minimumTemperature} to ${arduino.plant!.maximumTemperature}';
      case 1:
        return  'The humidity should be in the range of ${arduino.plant!.minimumHumidityAir} to ${arduino.plant!.maximumHumidityAir}';
      case 2:
        return  'The humidity should be in the range of ${arduino.plant!.minimumHumidityGround} to ${arduino.plant!.maximumHumidityGround}';
      case 3:
        return 'The light should be in the range of ${arduino.plant!.minimumLight} to ${arduino.plant!.maximumLight}';
      case 4:
        return 'The carbon dioxide should be in the range of ${arduino.plant!.minimumCarbonDioxide} to ${arduino.plant!.maximumCarbonDioxide}';
      default:
        return '';
    }
  }

  bool _isWithinRange(double? value, double? min, double? max) {
    if (value == null || min == null || max == null) return false;
    return value >= min && value <= max;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => currentParametersCubit,
        child: BlocBuilder<CurrentParametersCubit,CurrentParametersState>(
          builder: (context,state){

            if(state is CurrentParametersLoading){
              return Center(
                child: CircularProgressIndicator(color: Colors.red,),
              );
            }else if (state is CurrentParametersSuccess){

              print('good monkey');

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: parameters.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    parameters[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${_getValue(index,state.arduino)}',
                                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              _isParameterCorrect(index,state.arduino)
                                  ? _buildStatusIcon(Icons.check_circle_outline_rounded, Colors.green)
                                  : _buildStatusIcon(Icons.error_outline_rounded, Colors.red),
                            ],
                          ),
                        ),
                      ),
                      if (!_isParameterCorrect(index,state.arduino))
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            _getRecommendations(index,state.arduino),
                            style: TextStyle(fontSize: 16, color: AppColors.greenColor),
                          ),
                        ),
                    ],
                  );
                },
              );
            }else if(state is CurrentParametersError){
              return Center(
                child: Text(state.errorMessage),
              );
            }else{
              return SizedBox();
            }
          },
        ),
    );
  }

  Widget _buildStatusIcon(IconData icon, Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }

  String _getValue(int index,Arduino arduino) {
    switch (index) {
      case 0:
        return '${arduino.temperature}';
      case 1:
        return '${arduino.humidityAir}';
      case 2:
        return '${arduino.humidityGround}';
      case 3:
        return '${arduino.light}';
      case 4:
        return '${arduino.carbonDioxide}';
      default:
        return '';
    }
  }
}
