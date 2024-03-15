import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/CustomShadow.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/util/AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<String> ghItems = ['Green House 2', 'Green House 3'];
  List<String> plantsImage = [
    'assets/Plants/asparagus.jpg',
    'assets/Plants/carrots.jpg',
    'assets/Plants/eggplant.jpg',
    'assets/Plants/kale.jpg',
    'assets/Plants/onion.jpg',
    'assets/Plants/spinach.jpg',
    'assets/Plants/strawberry.jpg',
    'assets/Plants/turnip.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HalfRoundedContainer(title: 'Care Tips',color: AppColors.greenColor, textColor: Colors.white,),
          const SizedBox(height: 8,),
          Padding(
            padding:const EdgeInsets.only(left: 32),
            child: Container(
              height: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: plantsImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: CustomShadow.shadow,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/plant');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              plantsImage[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 32,),

          HalfRoundedContainer(title: 'Current warnings', color: AppColors.greenColor, textColor: Colors.white,),

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
                          Navigator.pushNamed(context, '/gh_info');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: CustomShadow.shadow,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/background.jpg'),
                              fit: BoxFit.cover,
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
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50.0),
                                          )
                                      ),
                                      child: const Center(child: Icon(Icons.error_outline_rounded,color: Colors.red, size: 30,)),
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
