import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_cubit.dart';

import '../cubit/news_states.dart';
import '../custom_widgets/item_builder.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsScienceLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsScienceSuccessfulState&&NewsCubit.get(context).currentIndex==2||state is NewsChangeBottomBarState) {
          // Display the list of business articles
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildItem(NewsCubit.get(context).science[index], context),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: NewsCubit.get(context).science.length,
          );
        } else if (state is NewsScienceErrorState) {
          // Display an error message
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }else if (state is NewsInitialState) {
          // Display an error message
          return Center(
            child: Text('Error: ${state}'),
          );
        }  else {
          // Handle other states if needed

          return const Center(
            child: Text('Unexpected state: loading'),
          );
        }
      },
    );
  }
}
