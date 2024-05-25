import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/widgets/show_variable.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/domain/usecases/search_by_everything.dart';
import 'package:news_app/features/presentation/bloc/article_state.dart';
import 'package:news_app/features/presentation/bloc/every_thing_cubit.dart';
import 'package:news_app/features/presentation/widgets/show.dart';
import 'package:provider/provider.dart';

class EveryThingTab extends StatefulWidget {
  const EveryThingTab({Key? key}) : super(key: key);

  @override
  State<EveryThingTab> createState() {
    return _EveryThingTabState();
  }
}

class _EveryThingTabState extends State<EveryThingTab> with AutomaticKeepAliveClientMixin{
  //************** */
  int _page = 10;
  //final _controller = ScrollController();
  final List<Widget> _items = [];

  @override
  void initState() {
    Provider.of<ShowVariables>(context, listen: false).addListener(() {
      _page = 10;
      _items.clear();
      Provider.of<EveryThingCubit>(context, listen: false).getEveryThingData(
          SearchByEverythingParams(
              q: Provider.of<ShowVariables>(context, listen: false).q,
              pageSize: _page));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<ShowVariables>(builder: (cx, data, _) {
      return BlocBuilder<EveryThingCubit, ArticleState>(
          builder: (context, articleState) {
        if (articleState is LoadingArticleState) {
          return Center(child: const CircularProgressIndicator());
        } else if (articleState is ErrorArticleState) {
          return Center(
            child: Text(articleState.message),
          );
        } else if (articleState is DataArticleState) {
          print(articleState.searchModel);
          for (int i = 0; i < articleState.searchModel.article.articles.length; i++) {
            _items.add(Show(
                model: (articleState.searchModel.article.articles[i]
                    as ArticleModel)));
          }
          return ListView.separated(
              itemBuilder: (context, index) => _items[index],
              separatorBuilder: (context, index) => Container(
                  width: double.infinity, height: 2, color: Colors.grey),
              itemCount: _items.length);
          
        } else {
          return const Center(
            child: Text("Enter Word For Search"),
          );
        }
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
