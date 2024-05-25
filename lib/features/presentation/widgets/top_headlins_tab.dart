import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/domain/usecases/search_by_top_headlines.dart';
import 'package:news_app/features/presentation/bloc/article_state.dart';
import 'package:news_app/features/presentation/bloc/tob_headlins_cubit.dart';
import 'package:news_app/features/presentation/widgets/show_variable.dart';
import 'show.dart';

class TopHeadlinsTab extends StatefulWidget {
  const TopHeadlinsTab({Key? key}) : super(key: key);

  @override
  State<TopHeadlinsTab> createState() => _TopHeadlinsTabState();
}

class _TopHeadlinsTabState extends State<TopHeadlinsTab> with AutomaticKeepAliveClientMixin{
  //****************************************** */
  int _page = 8;
  //final _controller = ScrollController();
  final List<Widget> _items = [];
  @override
  void initState() {
    Provider.of<ShowVariables>(context, listen: false).addListener(() {
      _page = 8;
      _items.clear();
      Provider.of<TopHeadlinsCubit>(context, listen: false).getTopHeadlinsData(
          SearchByTopHeadlinesParams(
              q: Provider.of<ShowVariables>(context, listen: false).q,
              pageSize: _page));
    });

    super.initState();
  }

  //********************************************** */

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<ShowVariables>(builder: (cx, data, _) {
      return BlocBuilder<TopHeadlinsCubit, ArticleState>(
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
            child: Text("Empty"),
          );
        }
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
