import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';
import '../cubit/news_states.dart';
import '../custom_widgets/item_builder.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // Checking the state to determine what to display
        if (state is NewsSportsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsSportsSuccessfulState&&NewsCubit.get(context).currentIndex==1||state is NewsChangeModeState) {
          // Display the list of business articles
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildItem(NewsCubit.get(context).sports[index], context),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: NewsCubit.get(context).sports.length,
          );
        } else if (state is NewsSportsErrorState) {
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
