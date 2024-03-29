import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/data/repository/file_store_repository.dart';
import 'package:green_control/domain/current_user.dart';
import 'package:green_control/presentation/GreenHousePages/GreenHousePage.dart';
import 'package:green_control/presentation/HomePage/HomePage.dart';
import 'package:green_control/presentation/SensorPages/SensorPage.dart';
import 'package:green_control/presentation/Widgets/BottomNavBarClipper.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/AppImage.dart';


class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _currentIndex = 1;
  Uint8List? bytes;

  @override
  void initState() {
    if(CurrentUser.currentUser == null){
      Navigator.pushReplacementNamed(context, '/');
    }

    getBytes();

    super.initState();
  }

  void getBytes() async {

    Uint8List? response = await downloadFile(CurrentUser.currentUser!.token, '65e1bc44a78f8d5755253076');
    setState(() {
      bytes = response;
    });

  }




  final List<Widget> _parts = [
    const GreenHouse(),
    const HomePage(),
    const SensorPage(),
  ];

  String getAppBarTitle(){
    switch(_currentIndex){
      case 0: return 'Green Houses';
      case 1: return 'Home';
      case 2: return 'Sensors';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(getAppBarTitle(), style:
          GoogleFonts.ribeyeMarrow(
              textStyle:TextStyle(fontSize: 32)
          )
        ),
        actions: [
          GestureDetector(
            onTap: (){

              Navigator.pushReplacementNamed(context, '/');
            },
            child: Container(
              margin: EdgeInsets.only(right: 16),
              child: bytes!= null ?
              CircleAvatar(
                radius: 20,
                backgroundImage: MemoryImage(bytes!),
              ):
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(Icons.person, size: 20, color: AppColors.greenColor),
              ),
            ),

          ),
        ],
      ),
      body: _parts[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.greenColor,
            backgroundColor: Colors.black,
            unselectedItemColor: AppColors.greyColor,
            unselectedLabelStyle: TextStyle(color: AppColors.greyColor,),
            selectedLabelStyle: TextStyle(color: AppColors.greenColor,),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.warehouse_rounded),
                label: 'Green Houses',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_tree_rounded),
                label: 'Sensors',
              ),

            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),

      floatingActionButton: _currentIndex == 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adding_new_gh');
        },
        backgroundColor: AppColors.greenColor,
        child: const Icon(Icons.add, color: Colors.white,size: 50,),
      ): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
