abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavigationBar extends NewsStates {}

// class NewsSearchBar extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {
  String? error;

  NewsBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {
  String? error;

  NewsScienceErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  String? error;

  NewsSportsErrorState(this.error);
}

class NewsGetSearchesLoadingState extends NewsStates {}

class NewsGetSearchesSuccessState extends NewsStates {}

class NewsSearchesErrorState extends NewsStates {
  String? error;

  NewsSearchesErrorState(this.error);
}
