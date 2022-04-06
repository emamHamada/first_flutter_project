import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubit/states.dart';
import 'package:tasks/modules/search/search.dart';

import '../databas/network/dio_helper.dart';
import '../modules/business/business_screen.dart';
import '../modules/science/science_screen.dart';
import '../modules/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Business',
              style: TextStyle(color: Colors.blueGrey.shade700)),
        ),
        icon: Icon(
          Icons.monetization_on_outlined,
          size: 25,
          color: Colors.blue.shade900,
        ),
        label: ''),
    BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
              Text('Sports', style: TextStyle(color: Colors.blueGrey.shade700)),
        ),
        icon: Icon(Icons.sports_soccer, color: Colors.blue.shade900, size: 25),
        label: ''),
    BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Science',
              style: TextStyle(color: Colors.blueGrey.shade700)),
        ),
        icon:
            Icon(Icons.science_outlined, color: Colors.blue.shade900, size: 25),
        label: ''),
    BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
              Text('Search', style: TextStyle(color: Colors.blueGrey.shade700)),
        ),
        icon: Icon(Icons.saved_search, color: Colors.blue.shade900, size: 25),
        label: ''),
  ];
  List screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SearchScreen(),
  ];

  void changeSelectedValue(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    if (index == 3) {
      getSearches('everyThing');
    }
    emit(NewsBottomNavigationBar());
  }

  //
  // bool x = false;
  //
  // getAppBar() async {
  //   if(currentIndex==3){
  //     x = true;
  //     emit(NewsSearchBar());
  //   }else{
  //     x=false;
  //     emit(NewsSearchBar());
  //   }
  //   emit(NewsBottomNavigationBar());
  // }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];

  getBusiness() async {
    emit(NewsGetBusinessLoadingState());
    try {
      var response = await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apikey': 'a025cf4a9bad489188be588190413fe0',
        },
      );
      debugPrint('${response.data['articles']}');

      business = response.data['articles'];
      debugPrint('${business.length}');
      emit(NewsGetBusinessSuccessState());
    } catch (error) {
      debugPrint('error in here0${error.toString()}');
      emit(NewsBusinessErrorState(error.toString()));
    }
  }

  getScience() async {
    emit(NewsGetScienceLoadingState());
    if (sports.isEmpty) {
      try {
        var response = await DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apikey': 'a025cf4a9bad489188be588190413fe0',
          },
        );
        debugPrint('${response.data['articles']}');

        science = response.data['articles'];
        debugPrint('${science.length}');
        emit(NewsGetScienceSuccessState());
      } catch (error) {
        debugPrint('error in here0${error.toString()}');
        emit(NewsScienceErrorState(error.toString()));
      }
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  getSports() async {
    emit(NewsGetSportsLoadingState());
    if (science.isEmpty) {
      try {
        var response = await DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apikey': 'a025cf4a9bad489188be588190413fe0',
          },
        );
        debugPrint('${response.data['articles']}');

        sports = response.data['articles'];
        debugPrint('${sports.length}');
        emit(NewsGetSportsSuccessState());
      } catch (error) {
        debugPrint('error in here0${error.toString()}');
        emit(NewsSportsErrorState(error.toString()));
      }
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  getSearches(String value) async {
    emit(NewsGetSearchesLoadingState());

    var response = await DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apikey': 'a025cf4a9bad489188be588190413fe0',
      },
    );
    debugPrint('${response.data['articles']}');
    search = response.data['articles'];
    debugPrint('${search.length}');
    emit(NewsGetSearchesSuccessState());
  }
}
