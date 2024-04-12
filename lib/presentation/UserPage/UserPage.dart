
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/domain/greenhouse/greenhouse.dart';
import 'package:green_control/presentation/UserPage/user_bloc/user_bloc.dart';
import 'package:green_control/presentation/Widgets/CustomExpanded.dart';
import 'package:intl/intl.dart';
import '../../config/custom_exeption.dart';
import '../../data/repository/analytic_repository.dart';
import '../../domain/analytic/analytic.dart';
import '../../domain/current_user.dart';
import '../../util/AppColors.dart';
import '../Widgets/char_builder.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(),
        child: UserForm(),
    );
  }
}


class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  Analytic? analytic;

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(
      loadUsersGreenhouseData(),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc,UserState>(
          builder: (context,state){

            if(state is UserSuccess){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  BlocProvider.of<UserBloc>(context).add(
                                    setUserAvatar(),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 16),
                                  child: state.image != null ?
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: MemoryImage(state.image!),
                                  ) :
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey.withOpacity(0.2),
                                    child: Icon(Icons.person, size: 50, color: AppColors.greenColor),
                                  ),
                                ),
                              ),
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
                                child: Text('${state.ghs.length}',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
                              )
                          ),
                        ],
                      ),
                
                      SizedBox(height: 16,),
                
                      CustomExpanded(ghs: state.ghs),
                
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
                ),
              );
            }else if(state is UserLoading){
              return _buildLoadingState();
            }else if(state is UserError){
              return _buildErrorState(state);
            }else{
              return Container();
            }

          }
      );
  }


  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(UserError state) {
    return Center(
      child: Text(state.errorMessage),
    );
  }
}


