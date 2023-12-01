import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_cubit.dart';
import 'package:free_news/cubit/news_states.dart';
import 'package:free_news/layers/search_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
            // backgroundColor: NewsCubit.get(context).isDark?Colors.white:Colors.black54,
            appBar: AppBar(
              // backgroundColor: Colors.transparent,
              // centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: const Icon(
                    Icons.search,

                    // color:cubit.isDark?Colors.black: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4_rounded),
                )
              ],
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                elevation: 100,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: cubit.bottomItems),
          );
        },

    );
  }
}
