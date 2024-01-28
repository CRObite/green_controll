import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/HalfRoundedContainer.dart';
import 'package:green_control/util/AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HalfRoundedContainer(title: 'Tips'),
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

          const HalfRoundedContainer(title: 'Main'),

          const SizedBox(height: 8,),

          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Green House', style: TextStyle(fontSize: 16),),
                        Container(
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
                      ],
                    ),
                  ),
                );
              },
            ),
          )


        ],
      ),
    );
  }
}
