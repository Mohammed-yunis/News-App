import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/search/search.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/styles/colors.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: screens[currentIndex],
          appBar: AppBar(
            title: Text(appBar[currentIndex]),
            actions: [
              DropdownButton(
                  dropdownColor:AppCubit.get(context).isDark?black:scaffoldBackground ,
                  value: AppCubit.get(context).currentCountry.toString(),
                  items: modelItemList(context),
                  onChanged: (value){
                    AppCubit.get(context).changeCountry(value);
                  }),
              IconButton(onPressed: () {navigateTo(context, const Search());}, icon: const Icon(Icons.search)),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).darkTheme();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_outlined), label: "Business"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_emoticon_sharp),
                  label: "Entertainment"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital), label: "Health"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science_rounded), label: "Science"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "Sports"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.computer), label: "Technology"),
            ],
            onTap: (index) {
              AppCubit.get(context).setIndex(index);
            },
            currentIndex: currentIndex,
          ),
        );
      },
    );
  }
  List<DropdownMenuItem<String>>?  modelItemList(context) {
    List<DropdownMenuItem<String>>? modelItems =
    models.entries.map<DropdownMenuItem<String>>(
          (entry) => DropdownMenuItem<String>(
        value: entry.value,
        child: Text(entry.key,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),),
      ),
    ).toList();
    return modelItems;
  }
}
