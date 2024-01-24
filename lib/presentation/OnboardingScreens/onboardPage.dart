import 'package:flutter/material.dart';
import 'package:green_control/presentation/OnboardingScreens/firstOnboardScreen.dart';
import 'package:green_control/presentation/OnboardingScreens/secondOnboardScreen.dart';
import 'package:green_control/presentation/OnboardingScreens/thirdOnboardScreen.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/AppText.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {

  int currentOnBoardPage = 0;
  final PageController _pageController = PageController(initialPage: 0);


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          FirstOnboardScreen(),
          SecondOnboardScreen(),
          ThirdOnboardScreen(),
        ],
        onPageChanged: (index){
          setState(() {
            currentOnBoardPage = index;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentOnBoardPage < 2 ? TextButton(
                onPressed: (){
                  _pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                },
                child: Text(
                  AppText.skip,
                  style: TextStyle(color:AppColors.darkGreenColor, fontSize: 24),
                )
            ): const SizedBox(width: 90,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                margin: const EdgeInsets.all(8),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentOnBoardPage ? AppColors.darkGreenColor : AppColors.greenColor,
                ),
              )
              ),
            ),

            TextButton(
                onPressed: (){
                  if(currentOnBoardPage < 2 ){
                    setState(() {
                      currentOnBoardPage++;
                      _pageController.animateToPage(currentOnBoardPage,
                          duration: const Duration(milliseconds: 300), curve: Curves.ease);
                    });
                  }else{
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                child: Text(
                  currentOnBoardPage < 2 ? AppText.next : AppText.login,
                  style: TextStyle(color:AppColors.darkGreenColor,fontSize: 24),
                )
            )
          ],
        ),
      ),
    );
  }
}
