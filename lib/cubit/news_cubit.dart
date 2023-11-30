import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_states.dart';
import 'package:free_news/layers/buisness_screen.dart';
import 'package:free_news/layers/science_screen.dart';
import 'package:free_news/layers/settings_screen.dart';
import 'package:free_news/layers/sports_screen.dart';
import 'package:free_news/net_work/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  // NewsCubit(super.initialState);

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];
  List<String> titles = [
    'Business Screen',
    'Sports Screen ',
    'Science Screen',
    'Setting Screen'
  ];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.tab,
          color: Colors.black,
        ),
        label: ' Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  // int index=0;
  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    if(business.length==0) {
      DioHelper.getData(
        // https://newsdata.io/api/1/news?apikey=pub_3373522609a30a383891bd1d18e8608c36725&q=YOUR_QUERY

        url: 'api/1/news',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'pub_3373522609a30a383891bd1d18e8608c36725',
        },
      ).then((value) {
        business = value.data['results'];
        // print(results[0]['title']);

        emit(NewsBusinessSuccessfulState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsBusinessErrorState(error.toString()));
      });
    }else{
      emit(NewsBusinessSuccessfulState());

    }
  }
  // https://newsdata.io/api/1/news?apikey=pub_3373522609a30a383891bd1d18e8608c36725
  //  https://newsapi.org/v2/top-headlines?country=us&apiKey=dd8264b8dbd64280910cdedf0274f920

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingState());
    //this if condition for get the data only one time not every time i clicked
if(sports.length==0)
        {
      DioHelper.getData(url:'api/1/news', query: {
        'country': 'us',
        'category': 'sports',
        "apiKey": 'pub_3373522609a30a383891bd1d18e8608c36725'
      }).then((value) {
        // print(value.data['articles'][0]['title']);
        sports.addAll(value.data['results']);
        emit(NewsSportsSuccessfulState());
      }).catchError((error) {
        emit(NewsSportsErrorState(error.toString()));
      });
    }else{
  emit(NewsSportsSuccessfulState());

}
  }






  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingState());

    DioHelper.getData(url: 'api/1/news', query: {
      'country': 'us',
      'category': 'science',
      "apiKey": 'pub_3373522609a30a383891bd1d18e8608c36725'
    }).then((value) {

      science = value.data['results'];
      emit(NewsScienceSuccessfulState());
    }).catchError((error) {
      // print(error);
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  changeIndex(index) {
    currentIndex = index;
      if(index==1) {
      getSports();
      emit(NewsSportsSuccessfulState());
    }else if(index==2){
      getScience();
      emit(NewsScienceSuccessfulState());

      }else{
        getBusiness();
        emit(NewsBusinessSuccessfulState());

      }

    emit(NewsChangeBottomBarState());
  }

  bool isDark = false;


  List<dynamic> search = [];

  void getSearch( String value) {
    emit(NewsSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      "apiKey": '65f7f556ec76449fa7dc7c0069f040ca'
      // 'dd8264b8dbd64280910cdedf0274f920'
    }).then((value) {
      // print(value.data['articles'][0]['title']);

      search = value.data['articles'];
      emit(NewsSearchSuccessfulState());
    }).catchError((error) {
      // print(error);
      emit(NewsSearchErrorState(error.toString()));
    });
  }
}
/*
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      print(isDark);
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }

    // emit(NewsChangeModeState());
  }
*/
/*
  void getBusiness() {
    emit(NewsBusinessLoadingState());


  DioHelper.getData(url:'v2/top-headlines', query: {
    'country': 'us',


    'category': 'business',
    "apiKey":  'dd8264b8dbd64280910cdedf0274f920'
  }).then((value) {
    business.addAll(value.data['articles']);

    emit(NewsBusinessSuccessfulState());
  }).catchError((error) {
    print(error);
    emit(NewsBusinessErrorState(error.toString()));
  });


  }
*/
