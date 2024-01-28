import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/util/AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> ghItems = ['Green House 2', 'Green House 3'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HalfRoundedContainer(title: 'Care Tips',color: Colors.white, textColor: Colors.black,),
          const SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Container(
              height: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),

                    child: const Center(
                      child: Text(
                        'Cucumber',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 32,),

          const HalfRoundedContainer(title: 'Current warnings', color: Colors.white, textColor: Colors.black,),

          const SizedBox(height: 8,),

          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ghItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/background.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(ghItems[index],style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),

                                Flexible(
                                    flex: 1,
                                    child:Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50.0),
                                          )
                                      ),
                                      child: const Center(child: Text('!',style: TextStyle(color: Colors.white),),),
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
          )
        ],
      ),
    );
  }
}
