import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/presentation/Widgets/CurrentParameters.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/util/AppColors.dart';

import 'greenhouse_info_bloc/greenhouse_info_bloc.dart';

class GreenHouseInfo extends StatefulWidget {
  const GreenHouseInfo({super.key, required this.greenhouseId});

  final int greenhouseId;


  @override
  State<GreenHouseInfo> createState() => _GreenHouseInfoState();
}

class _GreenHouseInfoState extends State<GreenHouseInfo> {




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
        title: Text('GreenHouse Info', style:
          GoogleFonts.ribeyeMarrow(
              textStyle:  TextStyle(fontSize: 32)
          )
        ),
      ),
      body:  BlocProvider(
        create: (context) => GreenhouseInfoBloc(),
        child: GreenHouseInfoForm(greenhouseId: widget.greenhouseId,),
      )
    );
  }
}


class GreenHouseInfoForm extends StatefulWidget {
  const GreenHouseInfoForm({super.key, required this.greenhouseId});

  final int greenhouseId;

  @override
  State<GreenHouseInfoForm> createState() => _GreenHouseInfoFormState();
}

class _GreenHouseInfoFormState extends State<GreenHouseInfoForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreenhouseInfoBloc,GreenhouseInfoState>(
        builder: (context,state){
          if(state is GreenhouseInfoSuccess){
            return SingleChildScrollView(
              child: Column(
                children: [
                  HalfRoundedContainer(title: state.gh.name ?? '???', color: AppColors.greenColor, textColor: Colors.white,),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('GreenHouse plants',style: TextStyle(fontSize: 16),),
                              SizedBox(height: 8,),
                              Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('${state.gh.arduino!.plant!.name}'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('GreenHouse sensor',style: TextStyle(fontSize: 16),),
                              SizedBox(height: 8,),
                              Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Arduino ${state.gh.arduino!.id}'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16,),

                  HalfRoundedContainer(
                      title:'Current Parameters',
                      color: AppColors.greenColor,
                      textColor: Colors.white
                  ),
                  const SizedBox(height: 8,),

                  const Padding(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: CurrentParameters()
                  ),

                ],
              ),
            );
          }else if(state is GreenhouseInfoLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is GreenhouseInfoError){
            return Center(
              child: Text(state.errorMessage),
            );
          }else{
            return Container();
          }
        }
    );
  }
}
