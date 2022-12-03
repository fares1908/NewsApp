abstract class NewsappState{}
class newsinitial extends NewsappState{}
class changebottomnav extends NewsappState{}
class NewsGetBusinessLoadingState extends NewsappState{}
class NewsGetBusinessSuccessState extends NewsappState{}
class NewsGetBusinessErrorState extends NewsappState{
  late final String error;
  NewsGetBusinessErrorState(this.error);

}

class NewsGetSportLoadingState extends NewsappState{}
class NewsGetSportSuccessState extends NewsappState{}
class NewsGetSportErrorState extends NewsappState{
  late final String error;
  NewsGetSportErrorState(this.error);

}
class NewsGetScienceLoadingState extends NewsappState{}
class NewsGetScienceSuccessState extends NewsappState{}
class NewsGetScienceErrorState extends NewsappState{
  late final String error;
  NewsGetScienceErrorState(this.error);

}
class NewsGetHealthLoadingState extends NewsappState{}
class NewsGetHealthSuccessState extends NewsappState{}
class NewsGetHealthErrorState extends NewsappState{
  late final String error;
  NewsGetHealthErrorState(this.error);

}
class NewsGetSearchLoadingState extends NewsappState{}
class NewsGetSearchSuccessState extends NewsappState{}
class NewsGetSearchErrorState extends NewsappState {
  late final String error;

  NewsGetSearchErrorState(this.error);

}
