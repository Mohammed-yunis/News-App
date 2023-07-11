import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../../shared/cubit/states.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: (BuildContext context, state) {return Scaffold(
        appBar: AppBar(
          title:const Text('Search for any thing')
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              textfield(
                hintstr: 'search',
                hintSize:20,
                onChange: (value){keyOfSearch=value;
                  AppCubit.get(context).getSearch();
                  },
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) { return divider(); },
                  itemCount: search.length,
                  itemBuilder: (BuildContext context, int index) {return itemBuilder(search[index],context);  },

                ),
              ),
            ],
          ),
        ),
      );  },
      listener: (BuildContext context, Object? state) {  },

    );
  }
}
