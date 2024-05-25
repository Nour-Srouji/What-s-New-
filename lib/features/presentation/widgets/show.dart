import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/features/data/models/article_model.dart';

class Show extends StatelessWidget {
  final ArticleModel model;
  const Show({
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
        (model.urlToImage == null)
            ? Container()
            : ClipRRect(
                child: Image.network(
                  model.urlToImage!,
                  width: 450,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
        const SizedBox(height: 20.0),
        (model.source.id == null)
            ? Container()
            : Text(
                model.source.id!,
                strutStyle: const StrutStyle(leading: 1),
              ),
        const SizedBox(height: 20.0),
        (model.source.name == null)
            ? Container()
            : Text(
                model.source.name!,
                strutStyle: const StrutStyle(leading: 1),
              ),
        const SizedBox(height: 20.0),
        (model.author == null)
            ? Container()
            : Text(
                model.author!,
                strutStyle: const StrutStyle(leading: 1),
              ),
        const SizedBox(height: 20.0),
        (model.title == null)
            ? Container()
            : Text(
                model.title!,
                maxLines: 3,
                strutStyle: const StrutStyle(leading: 1),
              ),
        const SizedBox(height: 20.0),
        (model.description == null)
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.description!,
                  maxLines: 3,
                  strutStyle: const StrutStyle(leading: 1),
                ),
              ),
        const SizedBox(height: 20.0),
        (model.url == null)
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.url!,
                  strutStyle: const StrutStyle(leading: 1),
                ),
              ),
        const SizedBox(height: 20.0),
        (model.publishedAt == null)
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.publishedAt!,
                  strutStyle: const StrutStyle(leading: 1),
                ),
              ),
        const SizedBox(height: 20.0),
        (model.content == null)
            ? Container()
            : Text(
                model.content!,
                strutStyle: const StrutStyle(leading: 1),
              ),
      ],
    );
  }
}
