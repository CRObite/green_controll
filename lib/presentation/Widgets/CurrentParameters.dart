import 'package:flutter/material.dart';
import 'package:green_control/domain/arduino/arduino.dart';
import 'package:green_control/util/AppColors.dart';

class CurrentParameters extends StatefulWidget {
  const CurrentParameters({Key? key, required this.arduino}) : super(key: key);

  final Arduino arduino;

  @override
  State<CurrentParameters> createState() => _CurrentParametersState();
}

class _CurrentParametersState extends State<CurrentParameters> {
  late List<String> parameters;
  late List<String> recommendations;

  @override
  void initState() {
    super.initState();
    parameters = ['Temperature', 'Humidity', 'Light', 'Carbon Dioxide'];
    recommendations = [
      'The temperature should be in the range of ${widget.arduino.plant!.minimumTemperature} to ${widget.arduino.plant!.maximumTemperature}',
      'The humidity should be in the range of ${widget.arduino.plant!.minimumHumidity} to ${widget.arduino.plant!.maximumHumidity}',
      'The light should be in the range of ${widget.arduino.plant!.minimumLight} to ${widget.arduino.plant!.maximumLight}',
      'The carbon dioxide should be in the range of ${widget.arduino.plant!.minimumCarbonDioxide} to ${widget.arduino.plant!.maximumCarbonDioxide}',
    ];
  }

  bool _isParameterCorrect(int index) {
    switch (index) {
      case 0:
        return _isWithinRange(widget.arduino.temperature, widget.arduino.plant!.minimumTemperature, widget.arduino.plant!.maximumTemperature);
      case 1:
        return _isWithinRange(widget.arduino.humidity, widget.arduino.plant!.minimumHumidity, widget.arduino.plant!.maximumHumidity);
      case 2:
        return _isWithinRange(widget.arduino.light, widget.arduino.plant!.minimumLight, widget.arduino.plant!.maximumLight);
      case 3:
        return _isWithinRange(widget.arduino.carbonDioxide, widget.arduino.plant!.minimumCarbonDioxide, widget.arduino.plant!.maximumCarbonDioxide);
      default:
        return false;
    }
  }

  bool _isWithinRange(double? value, double? min, double? max) {
    if (value == null || min == null || max == null) return false;
    return value >= min && value <= max;
  }

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
                          '${_getValue(index)}',
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    _isParameterCorrect(index)
                        ? _buildStatusIcon(Icons.check_circle_outline_rounded, Colors.green)
                        : _buildStatusIcon(Icons.error_outline_rounded, Colors.red),
                  ],
                ),
              ),
            ),
            if (!_isParameterCorrect(index))
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  recommendations[index],
                  style: TextStyle(fontSize: 16, color: AppColors.greenColor),
                ),
              ),
          ],
        );
      },
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

  String _getValue(int index) {
    switch (index) {
      case 0:
        return '${widget.arduino.temperature}';
      case 1:
        return '${widget.arduino.humidity}';
      case 2:
        return '${widget.arduino.light}';
      case 3:
        return '${widget.arduino.carbonDioxide}';
      default:
        return '';
    }
  }
}
