import 'package:flutter/material.dart';
import 'package:green_control/util/AppColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const Text('Home', style: TextStyle(fontSize: 32)),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 32,left: 32),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                child: Row(
                  children: [
                    Text('Tips', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
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
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
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

            const SizedBox(height: 16,),

            Container(
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(left: 32),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                child: Row(
                  children: [
                    Text('Main', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8,),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('4343434343'),
                );
              },
            )


          ],
        ),
      ),
    );
  }
}
