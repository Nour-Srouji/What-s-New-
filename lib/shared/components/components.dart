import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(article, context) => InkWell(
      onTap: () async {
        String url = article['url']; // Replace with your desired URL
        // ignore: deprecated_member_use
        if (await canLaunch(url)) {
          // ignore: deprecated_member_use
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      // navigateTo(context, WebViewScreen(article['url']));
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,

              height: 120,

              //   child: Image.network('${article['urlToImage']}'),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${article['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget articleBuilder(List list, context) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: ((context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,
          )),
      fallback: (BuildContext context) =>
          Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
