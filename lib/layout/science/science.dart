import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return ConditionalBuilder(
            condition: science.isNotEmpty,
            builder: (context) =>ListView.separated(
              separatorBuilder: (BuildContext context, int index) { return divider(); },
              itemCount: science.length,
              itemBuilder: (BuildContext context, int index) {return itemBuilder(science[index],context);  },

            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          ) ;
        },
      );
  }
}
