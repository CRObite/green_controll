import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/presentation/PlantPage/plant_bloc/plant_bloc.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/box_shadow.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key, required this.plantId});

  final int plantId;

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Plant Info', style:
        GoogleFonts.ribeyeMarrow(
            textStyle:  TextStyle(fontSize: 32)
        )
        ),
      ),
      body: BlocProvider(
          create: (context) => PlantBloc(),
          child: PlantForm(plantId: widget.plantId,),
      ),
    );
  }
}


class PlantForm extends StatefulWidget {
  const PlantForm({super.key, required this.plantId});

  final int plantId;

  @override
  State<PlantForm> createState() => _PlantFormState();
}

class _PlantFormState extends State<PlantForm> {


  @override
  void initState() {
    BlocProvider.of<PlantBloc>(context).add(
      loadPlantData(widget.plantId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantBloc,PlantState>(
        builder: (context,state){

          if(state is PlantSuccess){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.7/2),
                            bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.7/2),
                          ),
                          boxShadow: appShadow,
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(state.plant.name ?? '???',
                                style: GoogleFonts.ribeyeMarrow(
                                  textStyle:  TextStyle(
                                      color: Colors.white,
                                      fontSize: 32
                                  ),
                                )
                            ),

                            SizedBox(height: 16,),
                            state.bytes != null ?
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.25,
                              backgroundImage: MemoryImage(state.bytes!),
                            ): CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.25,
                              backgroundColor: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 16,),


                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 2,
                      children: [
                        gridItem('Optimal Temperature', '${state.plant.minimumTemperature?.toInt()}-${state.plant.maximumTemperature?.toInt()}'),
                        gridItem('Optimal Humidity', '${state.plant.minimumHumidity?.toInt()}-${state.plant.maximumHumidity?.toInt()}'),
                        gridItem('Optimal Lighting ', '${state.plant.minimumLight?.toInt()}-${state.plant.maximumLight?.toInt()}'),
                        gridItem('Optimal CO2 Level', '${state.plant.minimumCarbonDioxide?.toInt()}-${state.plant.maximumCarbonDioxide?.toInt()}'),
                      ],
                    ),
                  ),


                  SizedBox(height: 16,),


                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: appShadow,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.plant.description ?? 'No description'),
                    ),
                  )


                ],
              ),
            );
          }else if(state is PlantLoading){
            return _buildLoadingState();
          }else if(state is PlantError){
            return _buildErrorState(state);
          }else{
            return Container();
          }

        }
    );
  }

  Widget gridItem(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: appShadow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
        subtitle: Text(subtitle,
          style: TextStyle(color: AppColors.blueColor, fontSize: 20),
        ),
      ),
    );
  }


  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(PlantError state) {
    return Center(
      child: Text(state.errorMessage),
    );
  }


}
