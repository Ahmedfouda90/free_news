import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_cubit.dart';
import 'package:free_news/cubit/news_states.dart';
import 'package:free_news/custom_widgets/item_builder.dart';
import 'package:free_news/layers/home_screen.dart';
import 'package:free_news/net_work/remote/dio_helper.dart';

void main() {
  DioHelper.init();

  runApp(FreeNews());
}

class FreeNews extends StatelessWidget {
  const FreeNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness(),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewsBusinessSuccessfulState) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildItem(NewsCubit.get(context).business[index], context),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount:  NewsCubit.get(context).business.length,
                );
              }else if(
              state is NewsBusinessLoadingState
              ){
                return Center(child: CircularProgressIndicator(),);
              } else {
                // Handle other states if needed

                return  Center(
                  child: Text('Unexpected state : ${state.toString()}'),
                );
              }
            },
          ),
        ));
  }
}
