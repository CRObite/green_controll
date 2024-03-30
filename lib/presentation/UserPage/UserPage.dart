import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../data/repository/file_store_repository.dart';
import '../../domain/current_user.dart';
import '../../util/AppColors.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  Uint8List? bytes;

  List<String> ghn = ['GreenHouse 1','GreenHouse 2','GreenHouse 3'];
  List<String> ghp = ['Cucumber','Santa','Mar'];

  @override
  void initState() {

    getBytes();

    super.initState();
  }

  void getBytes() async {

    Uint8List? response = await downloadFile(CurrentUser.currentUser!.token, CurrentUser.currentUser!.profilePicture);
    setState(() {
      bytes = response;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [

                  Positioned(
                    bottom: 0,
                    right: 15,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),

                      child: Icon(Icons.edit, color: Colors.white,size: 15,),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16),
                      child: bytes != null ?
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(bytes!),
                      ) :
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Icon(Icons.person, size: 50, color: AppColors.greenColor),
                      ),
                    ),
                  ),


                ],
              ),

              SizedBox(width: 16,),

              Expanded(
                child: ListTile(
                  title: Text(CurrentUser.currentUser!.firstName ?? '', style: TextStyle(fontSize: 24),),
                  subtitle: Text(CurrentUser.currentUser!.lastName ?? '', style: TextStyle(fontSize: 18),),
                ),
              )
            ],
          ),


          SizedBox(height: 32,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Number of greenhouse:',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Container(
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0 ,horizontal: 16),
                    child: Text('3',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
                  )
              ),
            ],
          ),



          ListView.builder(
              itemCount: ghn.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ghn[index],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0 ,horizontal: 16),
                        child: Text(ghp[index],style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),)
                      )
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 32,),



          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Log out', style: TextStyle(color: Colors.white),),
                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}
