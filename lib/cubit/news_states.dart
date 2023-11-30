abstract class NewsStates {}

class NewsInitialState extends NewsStates {}
class NewsChangeBottomBarState extends NewsStates {}
class NewsBusinessLoadingState extends NewsStates {}
class NewsBusinessSuccessfulState extends NewsStates {}
class NewsBusinessErrorState extends NewsStates {
  final String error;

  NewsBusinessErrorState(this.error);
}
class NewsSportsLoadingState extends NewsStates {}
class NewsSportsSuccessfulState extends NewsStates {}
class NewsSportsErrorState extends NewsStates {
  final String error;

  NewsSportsErrorState(this.error);
}
class NewsScienceLoadingState extends NewsStates {}
class NewsScienceSuccessfulState extends NewsStates {}
class NewsScienceErrorState extends NewsStates {
  final String error;

  NewsScienceErrorState(this.error);
}
class NewsChangeModeState extends NewsStates {
}
class NewsSearchSuccessfulState extends NewsStates {}
class NewsSearchErrorState extends NewsStates {
  final String error;

  NewsSearchErrorState(this.error);
}
class NewsSearchLoadingState extends NewsStates {}
