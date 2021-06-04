import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/cubit/cubit.dart';
import 'package:flutter_app_newsv1/Layout/cubit/states.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasksScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = TodoCubit.get(context).archivedTasks;

        return Scaffold(
          body: tasksBuilder(list),
        );
      },
    );
  }
}