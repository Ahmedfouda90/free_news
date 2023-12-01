import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_cubit.dart';
import 'package:free_news/cubit/news_states.dart';
import 'package:free_news/custom_widgets/custom_form_field.dart';
import 'package:free_news/custom_widgets/item_builder.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchList = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
                decoration: const InputDecoration(label: Text('search')
                ,border: OutlineInputBorder()
                     ,prefixIcon: Icon(Icons.search),

                ),
              ),
                state is! NewsSearchLoadingState?
                Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildItem(NewsCubit.get(context).search[index], context),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey,
                    height: 5,
                  ),
                  itemCount: NewsCubit.get(context).search.length,
                ),
              ) :Center(child: CircularProgressIndicator(),)// buildItem(context, searchList)
            ],
          ),
        );
      },
    );
  }
}

/*              CustomFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'please enter some text';
                    } else
                      return null;
                  },
                  prefix: Icon(Icons.search_sharp),
                  labelText: "search",
                  prefixPressed: () {},
                  textInputType: TextInputType.text,
                  controller: searchController),
*/
