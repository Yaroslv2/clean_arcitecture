import 'package:clean_architecture/domain/bloc/sign_up_page/sign_up_page_bloc.dart';
import 'package:clean_architecture/domain/model/department.dart';
import 'package:clean_architecture/domain/model/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnviromentStep extends StatefulWidget {
  const EnviromentStep({super.key});

  @override
  State<EnviromentStep> createState() => _EnviromentStepState();
}

class _EnviromentStepState extends State<EnviromentStep> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "Организация",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<SignUpPageBloc, SignUpPageState>(
                    builder: (context, state) {
                      return DropdownMenu(
                        width: MediaQuery.of(context).size.width - 32,
                        dropdownMenuEntries: state.enviroments
                            .map<DropdownMenuEntry<Enviroment>>(
                              (i) => DropdownMenuEntry<Enviroment>(
                                value: i,
                                label: i.name,
                              ),
                            )
                            .toList(),
                        onSelected: (value) {
                          if (value == null ||
                              !state.enviroments.contains(value)) {
                            BlocProvider.of<SignUpPageBloc>(context).add(
                                SignUpPageEvent.changeDepsActivity(
                                    isActive: false));
                            return;
                          }
                      
                          BlocProvider.of<SignUpPageBloc>(context)
                              .add(SignUpPageEvent.getDeps(id: value.id));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 7,),
                  BlocBuilder<SignUpPageBloc, SignUpPageState>(
                    builder: (context, state) {
                      return DropdownMenu(
                        width: MediaQuery.of(context).size.width - 32,
                        enabled: state.isDepsEnable,
                        dropdownMenuEntries: state.departments
                            .map<DropdownMenuEntry<Department>>(
                              (i) => DropdownMenuEntry(
                                value: i,
                                label: i.name,
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
