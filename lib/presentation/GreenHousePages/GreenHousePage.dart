import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/presentation/GreenHousePages/greenhouse_bloc/greenhouse_bloc.dart';
import 'package:green_control/presentation/HomePage/HomePage.dart';

import '../Widgets/CustomShadow.dart';
import '../Widgets/LongTextField.dart';

class GreenHouse extends StatefulWidget {
  const GreenHouse({super.key});

  @override
  State<GreenHouse> createState() => _GreenHouseState();
}

class _GreenHouseState extends State<GreenHouse> {
  List<String> ghItems = ['Green House 1', 'Green House 2', 'Green House 3'];
  List<String> ghPlantsItems = ['Tomatoes', 'Onion', 'Cucumber'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GreenhouseBloc(),
      child: GreenhouseForm(),
    );
  }
}

class GreenhouseForm extends StatefulWidget {
  const GreenhouseForm({super.key});

  @override
  State<GreenhouseForm> createState() => _GreenhouseFormState();
}

class _GreenhouseFormState extends State<GreenhouseForm> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<GreenhouseBloc>(context).add(
      loadAllGreenhouseData(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreenhouseBloc, GreenhouseState>(
        builder: (context, state) {
      if (state is GreenhouseLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GreenhouseError) {
        return Center(
          child: Text(state.errorMessage),
        );
      } else if (state is GreenhouseSuccess) {
        return SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: LongTextField(
                        type: TextInputType.text,
                        hintText: 'Green House Name',
                        controller: _editingController),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            state.ghs.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.ghs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/gh_info');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/background.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: CustomShadow.shadow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.ghs[index].name ?? '???',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${state.ghs[index].arduino!.plant!.name}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)
                                                )
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)
                                                )
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                BlocProvider.of<GreenhouseBloc>(context).add(
                                                  deleteGreenhouseData(ghId: state.ghs[index].id),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Center(
                        child: Text(
                            'No greenhouse, you can add it by "+" button')
                    )
                ),
              ],
            )
        );
      } else {
        return Container();
      }
    });
  }
}
