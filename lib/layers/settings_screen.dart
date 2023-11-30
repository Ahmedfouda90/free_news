import 'package:flutter/material.dart';

import '../cubit/news_cubit.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(NewsCubit.get(context).titles[NewsCubit.get(context).currentIndex])),

    );
  }
}
