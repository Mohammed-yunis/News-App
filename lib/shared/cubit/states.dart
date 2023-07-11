abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppNewsGetBusinessStateSuccess extends AppStates{}

class AppNewsGetBusinessStateError extends AppStates{
  late final String error;
  AppNewsGetBusinessStateError(this.error);
}

class AppNewsGetEntertainmentStateSuccess extends AppStates{}

class AppNewsGetEntertainmentStateError extends AppStates{
  late final String error;
  AppNewsGetEntertainmentStateError(this.error);
}

class AppNewsGetHealthStateSuccess extends AppStates{}

class AppNewsGetHealthStateError extends AppStates{
  late final String error;
  AppNewsGetHealthStateError(this.error);
}

class AppNewsGetScienceStateSuccess extends AppStates{}

class AppNewsGetScienceStateError extends AppStates{
  late final String error;
  AppNewsGetScienceStateError(this.error);
}

class AppNewsGetSportsStateSuccess extends AppStates{}

class AppNewsGetSportsStateError extends AppStates{
  late final String error;
  AppNewsGetSportsStateError(this.error);
}

class AppNewsGetTechnologyStateSuccess extends AppStates{}

class AppNewsGetTechnologyStateError extends AppStates{
  late final String error;
  AppNewsGetTechnologyStateError(this.error);
}

class AppBottomState extends AppStates{}

class AppDakState extends AppStates{}

class AppNewsGetSearchStateSuccess extends AppStates{}

class AppNewsGetSearchStateError extends AppStates{
  late final String error;
  AppNewsGetSearchStateError(this.error);
}

class ChangeCurrentCountry extends AppStates{}

