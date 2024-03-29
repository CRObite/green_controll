import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:green_control/presentation/HomePage/home_bloc/home_bloc.dart';
import 'package:green_control/presentation/Widgets/CustomShadow.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/presentation/Widgets/ImageBuilder.dart';
import 'package:green_control/util/AppColors.dart';

import '../../domain/plants/plant.dart';
import '../PlantPage/PlantPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomeForm(),
    );
  }
}

class HomeForm extends StatefulWidget {
  const HomeForm({Key? key}) : super(key: key);

  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {


  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      loadAllData(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return _buildLoadingState();
        } else if (state is HomeSuccess) {
          return _buildSuccessState(state);
        } else if (state is HomeError) {
          return _buildErrorState(state);
        } else {
          return Container(); // Default empty container
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessState(HomeSuccess state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCareTipsSection(state),
          SizedBox(height: 8),
          _buildPlantsGridView(state),
          SizedBox(height: 8),
          _buildWarningsSection(state),
        ],
      ),
    );
  }

  Widget _buildErrorState(HomeError state) {
    return Center(
      child: Text(state.errorMessage),
    );
  }

  Widget _buildCareTipsSection(HomeSuccess state) {
    return HalfRoundedContainer(
      title: 'Care Tips',
      color: AppColors.greenColor,
      textColor: Colors.white,
    );
  }

  Widget _buildPlantsGridView(HomeSuccess state) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Container(
        height: 250,
        child: state.plants.isNotEmpty
            ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: state.plants.length,
          itemBuilder: (context, index) {
            return _buildPlantItem(state.plants[index]);
          },
        )
            : Center(
          child: Text('No care tips'),
        ),
      ),
    );
  }

  Widget _buildPlantItem(Plant plant) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: CustomShadow.shadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantPage(plantId: plant.id)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: plant.imageUrl != null
                  ? ImageBuilder(mediaID: plant.imageUrl!)
                  : Center(
                child: Text(plant.name ?? '???'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWarningsSection(HomeSuccess state) {
    return Column(
      children: [
        HalfRoundedContainer(
          title: 'Current warnings',
          color: AppColors.greenColor,
          textColor: Colors.white,
        ),
        SizedBox(height: 8),
        _buildWarningsList(state),
      ],
    );
  }

  Widget _buildWarningsList(HomeSuccess state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: state.ghs.isNotEmpty
          ? ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.ghs.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildWarningItem(state.ghs[index]);
        },
      ) : Center(
        child: Container(
          margin: EdgeInsets.only(top: 32),
            child: Text('No warnings', style: TextStyle(fontSize: 20),)
        ),
      ),
    );
  }

  Widget _buildWarningItem(GreenHouse gh) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/gh_info');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: CustomShadow.shadow,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gh.name ?? '???',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
