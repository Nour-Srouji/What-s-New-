import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search must not empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Search '),
                    suffixIcon: Icon(Icons.search),
                    // prefix: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(child: articleBuilder(list, context))
            ],
          ),
        );
      },
    );
  }
}
