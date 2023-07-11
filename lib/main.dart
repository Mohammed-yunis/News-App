import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/mainscreen/start.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cacheHelper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/styles/MyBlocObserver.dart';
import 'package:news_app/styles/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
 bool? isDark = CacheHelper.getBool(key:'isdark');
  runApp(NewsApp(isDark: isDark,));
}
class NewsApp extends StatelessWidget {

  final bool? isDark;
  const NewsApp({Key? key,this.isDark }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create:(context)=>AppCubit()..getBusiness()..darkTheme(shared: isDark)..getEntertainment()..getHealth()..getScience()..getSports()..getTechnology(),
      child:BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
    builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Directionality(
              textDirection: TextDirection.ltr,
                child: Main()),
            theme: ThemeData(
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: black
                  )
                ),
                scaffoldBackgroundColor: scaffoldBackground,
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: scaffoldBackground,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor:scaffoldBackground,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                 iconTheme: IconThemeData(
                   color: black,
                 ),
                 actionsIconTheme: IconThemeData(
                      color: black,
                      size: 28
                 )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: scaffoldBackground,
                  selectedItemColor: Colors.deepOrange,
                  showUnselectedLabels: false,

                ),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: scaffoldBackground
                  )
              ),
              scaffoldBackgroundColor: black,
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor:black,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color:scaffoldBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  actionsIconTheme: IconThemeData(
                      color: scaffoldBackground,
                      size: 28
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: black,
                selectedItemColor: Colors.deepOrange,
                showUnselectedLabels: false,
                unselectedItemColor:Colors.grey

              ),
            ),
            themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,

          );
    }
      )
    );
  }
}

