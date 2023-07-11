import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return ConditionalBuilder(
            condition: sports.isNotEmpty,
            builder: (context) =>ListView.separated(
              separatorBuilder: (BuildContext context, int index) { return divider(); },
              itemCount: sports.length,
              itemBuilder: (BuildContext context, int index) {return itemBuilder(sports[index],context);  },

            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          ) ;
        },
      );
  }
}
