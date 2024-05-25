import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/features/data/models/article_source_model.dart';

class ShowSource extends StatelessWidget {
  final ArticleSourceModel model;
  const ShowSource({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 22,
          width: 22,
        ),
        (model.category == null)
            ? Container()
            : ClipRRect(
                child: Image.network(
                  model.country!,
                  width: 450,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
        const SizedBox(height: 20.0),
        (model.description == null)
            ? Container()
            : Text(
                model.description!,
                strutStyle: const StrutStyle(leading: 1),
              ),
        (model.url == null)
            ? Container()
            : Text(
                model.url!,
                strutStyle: const StrutStyle(leading: 1),
              ),
      ],
    );
  }
}
