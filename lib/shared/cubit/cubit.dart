import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cacheHelper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  void setIndex(index){
    currentIndex=index;
    emit(AppBottomState());
  }
 String currentCountry='us';
  void getBusiness(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':currentCountry,
          'category':'business',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      business=value.data['articles'];
      emit(AppNewsGetBusinessStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetBusinessStateError(error.toString()));
    });
  }

  void getEntertainment(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':currentCountry,
          'category':'entertainment',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      entertainment=value.data['articles'];
      emit(AppNewsGetEntertainmentStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetEntertainmentStateError(error.toString()));
    });
  }

  void getHealth(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':currentCountry,
          'category':'health',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      health=value.data['articles'];
      emit(AppNewsGetHealthStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetHealthStateError(error.toString()));
    });
  }

  void getScience(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':currentCountry,
          'category':'science',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      science=value.data['articles'];
      emit(AppNewsGetScienceStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetScienceStateError(error.toString()));
    });
  }

  void getSports(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':currentCountry,
          'category':'sports',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      sports=value.data['articles'];
      emit(AppNewsGetSportsStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetSportsStateError(error.toString()));
    });
  }

  void getTechnology(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':currentCountry,
          'category':'technology',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      technology=value.data['articles'];
      emit(AppNewsGetTechnologyStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetTechnologyStateError(error.toString()));
    });
  }

  //https://newsapi.org/v2/everything?q=tesla&from=2022-09-08&sortBy=publishedAt&apiKey=a6ae411a51eb4281a2724bf1357114fd

  void getSearch(){
    search=[];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$keyOfSearch',
          'apiKey':'a6ae411a51eb4281a2724bf1357114fd',
        }
    ).then((value) {
      search=value.data['articles'];
      emit(AppNewsGetSearchStateSuccess());
    }).catchError((error){
      if (kDebugMode) print(error.toString());
      emit(AppNewsGetSearchStateError(error.toString()));
    });
  }



bool isDark=false;
  void darkTheme({bool? shared}){
 if (shared != null ) {
   isDark=shared;
 } else {
   isDark= !isDark;
   CacheHelper.putBool(key:'isdark', value: isDark).then((value) => emit(AppDakState()));
 }
  }

  void changeCountry(value){
      currentCountry=value.toString();
      emit(ChangeCurrentCountry());
      getBusiness();
      getEntertainment();
      getHealth();
      getScience();
      getSports();
      getTechnology();
  }
}