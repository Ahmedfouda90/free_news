import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_cubit.dart';
import 'package:free_news/custom_widgets/item_builder.dart';


import '../cubit/news_states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // Checking the state to determine what to display
        if (state is NewsBusinessLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsBusinessSuccessfulState&&NewsCubit.get(context).currentIndex==0||state is NewsChangeBottomBarState) {
          // Display the list of business articles
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildItem(NewsCubit.get(context).business[index], context),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: NewsCubit.get(context).business.length,
          );
        } else if (state is NewsBusinessErrorState) {
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
          print(state);

          return const Center(
            child: Text('Unexpected state'),
          );
        }
      },
    );
  }
}
