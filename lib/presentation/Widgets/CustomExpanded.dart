import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/domain/analytic/analytic.dart';
import 'package:green_control/presentation/Widgets/custom_expanded_cubit/custom_expanded_cubit.dart';
import 'package:intl/intl.dart';

import '../../domain/greenhouse/greenhouse.dart';
import '../../util/AppColors.dart';
import 'char_builder.dart';



class CustomExpanded extends StatefulWidget {
  const CustomExpanded({super.key, required this.ghs});

  final List<GreenHouse> ghs;

  @override
  State<CustomExpanded> createState() => _CustomExpandedState();
}

class _CustomExpandedState extends State<CustomExpanded> {

  List<String> parameters = ['Temperature', 'Air Humidity','Ground Humidity', 'Light', 'Carbon Dioxide'];
  final customExpandedCubit = CustomExpandedCubit();



  List<String> getAllDates(Analytic? analytic ,int index){

    List<String> dates = [];

    if(analytic != null){
      analytic.averagesPerDay.forEach((element) {
        DateTime dateTime = DateTime.parse(element.date!);
        String formattedDate = DateFormat('dd.MM').format(dateTime);

        dates.add(formattedDate);
      });
    }

    return dates;
  }

  List<double> getAllValues(Analytic? analytic, int index) {
    List<double> scores = [];

    if (analytic != null) {
      analytic.averagesPerDay.forEach((element) {
        double? value;
        switch (index) {
          case 0:
            value = element.averages!.avgTemperature;
            break;
          case 1:
            value = element.averages!.avgHumidityAir;
            break;
          case 2:
            value = element.averages!.avgHumidityGround;
            break;
          case 3:
            value = element.averages!.avgLight;
            break;
          case 4:
            value = element.averages!.avgCO2;
            break;
          default:
            break;
        }

        if (value != null) {

          double roundedValue = double.parse(value.toStringAsFixed(1));
          scores.add(roundedValue);
        } else {
          scores.add(0.0);
        }
      });
    }

    return scores;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => customExpandedCubit,
      child: BlocBuilder<CustomExpandedCubit,CustomExpandedState>(
          builder: (context,state){
            return ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) {

                if(isExpanded){
                  customExpandedCubit.loadAnalyticsData(widget.ghs[index].arduino!.id);
                }

                setState(() {
                  widget.ghs[index].isExpanded = isExpanded;
                });

              },
              children: widget.ghs.map<ExpansionPanel>((GreenHouse greenhouse) {

                if(state is CustomExpandedLoading ||state is CustomExpandedInitial ){
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          width: double.infinity,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(greenhouse.name ?? '???',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.greenColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        )
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0 ,horizontal: 16),
                                        child: Text(greenhouse.arduino!.plant!.name ?? '???',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                                    )
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      body: Center(child: CircularProgressIndicator()),
                      isExpanded: greenhouse.isExpanded
                  );
                }else if(state is CustomExpandedSuccess){
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          width: double.infinity,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(greenhouse.name ?? '???',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.greenColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        )
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0 ,horizontal: 16),
                                        child: Text(greenhouse.arduino!.plant!.name ?? '???',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                                    )
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      body:  state is CustomExpandedLoading ?
                      Center(child: CircularProgressIndicator(),) :
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        width: double.infinity,
                        height: 240*5,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(parameters[index]),
                                      SizedBox(height: 16,),
                                      ChartBuilder(
                                        dates: getAllDates(state.analytic, index),
                                        positions: getAllValues(state.analytic, index),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                        ),
                      ),
                      isExpanded: greenhouse.isExpanded
                  );
                }else {
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded){
                        return Container();
                      },
                      body: Container()
                  );
                }

              }).toList(),
            );
          }
      )
    );
  }
}



