import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations_implementation.dart';
import 'package:news_app/features/data/models/error_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:news_app/features/data/models/search_model.dart';

void main() {
  group("testing for global", () {
    test('Testing for GlobalSeachOperation everything', () async {
      GlobalSearchImplementation op = GlobalSearchImplementation();
      Either<SearchModel, ErrorArticleModel> result =
          await op.searchByEverythingGlobally(
              q: "sport", sources: "bbc-news", pageSize: 3);

      SearchModel result2 = SearchModel.fromJson({
        "status": "ok",
        "totalResults": 615,
        "articles": [
          {
            "source": {"id": "bbc-news", "name": "BBC News"},
            "author": "https://www.facebook.com/bbcnews",
            "title":
                "Pride jersey controversy - a reckoning for Australian sport?",
            "description":
                "A boycott by seven rugby league players over a pride jersey has sparked a massive backlash.",
            "url": "https://www.bbc.co.uk/news/world-australia-62331136",
            "urlToImage":
                "https://ichef.bbci.co.uk/news/1024/branded_news/103FF/production/_126095566_gettyimages-1411403826.jpg",
            "publishedAt": "2022-07-29T23:32:10Z",
            "content":
                "By Tiffanie TurnbullBBC News, Sydney\r\nThursday night was supposed a proud moment in Australian sporting history.\r\nFor the first time, a team in the National Rugby League (NRL) would take to the field… [+6271 chars]"
          },
          {
            "source": {"id": "bbc-news", "name": "BBC News"},
            "author": null,
            "title":
                "Carl Froch column: Anthony Joshua could retire if he loses convincingly to Oleksandr Usyk",
            "description":
                "In his BBC Sport column, Carl Froch says Anthony Joshua could retire if he is knocked out by - or loses heavily on points to - world champion Oleksandr Usyk.",
            "url": "https://www.bbc.co.uk/sport/boxing/62548163",
            "urlToImage":
                "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/1A42/production/_126322760_gettyimages-1342509938.jpg",
            "publishedAt": "2022-08-17T05:53:33Z",
            "content":
                "Anthony Joshua (left) lost his WBA, WBO and IBF titles in a unanimous points defeat to Oleksandr Usyk at the Tottenham Hotspur Stadium in September\r\nBoxing analyst and former super-middleweight world… [+8230 chars]"
          },
          {
            "source": {"id": "bbc-news", "name": "BBC News"},
            "author": null,
            "title": "Euro 2022: What to look out for in the quarter-finals",
            "description":
                "Are England set for Euro 2022 glory? Who might stop them? And who will finish as top scorer? BBC Sport picks out five things to look out for as the knockout stages begin.",
            "url": "https://www.bbc.co.uk/sport/football/62192755",
            "urlToImage":
                "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/70DF/production/_125959882_england-celebrate.jpg",
            "publishedAt": "2022-07-20T05:33:28Z",
            "content":
                "Euro 2022 has attracted record-breaking crowds\r\nEuro 2022 is already proving to be a memorable tournament and we have only reached the quarter-final stage.\r\nThe crowds have turned out like never befo… [+5681 chars]"
          }
        ]
      });

      expect(result.first != null && result2 == result.first, true);
    });
//******************************************************************************
//******************************************************************************
    test('Testing for GlobalSeachOperation top_headlines', () async {
      GlobalSearchImplementation op = GlobalSearchImplementation();
      Either<SearchModel, ErrorArticleModel> result =
          await op.searchByTopHeadlinesGlobally(
              q: "lg", pageSize: 3, category: "technology", country: "us");

      SearchModel result2 = SearchModel.fromJson({
        "status": "ok",
        "totalResults": 2,
        "articles": [
          {
            "source": {"id": "polygon", "name": "Polygon"},
            "author": "Ryan Gilliam",
            "title":
                "Popular PC mod sites ban anti-Pride flag modders in Marvel’s Spider-Man - Polygon",
            "description":
                "Anti-LGBTQ modders have already created mods to remove the the Pride flags from Marvel’s Spider-Man’s New York. However, popular mod sites like Nexus Mods and ModDB have taken a stand against these actions, banning the users",
            "url":
                "https://www.polygon.com/23311318/marvels-spider-man-pc-mod-pride-flag-ban-nexus-mods-moddb",
            "urlToImage":
                "https://cdn.vox-cdn.com/thumbor/3Tu-GfFHXsQRq3lCWSojBVfcpnQ=/0x38:1920x1043/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/19410617/Spider_Man_PS4_2018_04_04_18_002.jpg",
            "publishedAt": "2022-08-18T15:15:00Z",
            "content":
                "InsomniacsMarvels Spider-Man recently made the jump from PlayStation exclusivity to Windows PC, just as Sonys God of War did earlier this year. Naturally, the sprawling, open-world superhero game has… [+2567 chars]"
          },
          {
            "source": {
              "id": "the-washington-post",
              "name": "The Washington Post"
            },
            "author": "Gerrit De Vynck, Rachel Lerman",
            "title":
                "At Google, robots go to school and learn using AI algorithms - The Washington Post",
            "description":
                "In a drab Google office park in Silicon Valley, robots are going to school, using AI algorithms to learn how to play ping pong and clean up after humans.",
            "url":
                "https://www.washingtonpost.com/technology/2022/08/16/google-ai-robot-school/",
            "urlToImage":
                "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://d1i4t8bqe7zgj6.cloudfront.net/08-16-2022/t_8173f0650bed4af9b812985bca0bb96e_name_google_bot_2.jpg&w=1440",
            "publishedAt": "2022-08-16T23:00:00Z",
            "content":
                "Placeholder while article actions load\r\nMOUNTAIN VIEW, Calif. Researchers here at Googles lab recently asked a robot to build a burger out of various plastic toy ingredients.\r\nThe mechanical arm knew… [+6251 chars]"
          }
        ]
      });
      print(result.first!.totalResults);
      expect(result.first != null && result2 == result.first, true);
    });
//******************************************************************************
//******************************************************************************
    test('Test request api for GlobalSeachOperation top_headlines_sources',
        () async {
      GlobalSearchImplementation op = GlobalSearchImplementation();
      Either<SearchBySourceModel, ErrorArticleModel> result =
          await op.searchByTopHeadlinesAndSourcesGlobally(
              category: "sports", country: "us", language: "en");

      SearchBySourceModel result2 = SearchBySourceModel.fromJson({
        "status": "ok",
        "sources": [
          {
            "id": "bleacher-report",
            "name": "Bleacher Report",
            "description":
                "Sports journalists and bloggers covering NFL, MLB, NBA, NHL, MMA, college football and basketball, NASCAR, fantasy sports and more. News, photos, mock drafts, game scores, player profiles and more!",
            "url": "http://www.bleacherreport.com",
            "category": "sports",
            "language": "en",
            "country": "us"
          },
          {
            "id": "espn",
            "name": "ESPN",
            "description":
                "ESPN has up-to-the-minute sports news coverage, scores, highlights and commentary for NFL, MLB, NBA, College Football, NCAA Basketball and more.",
            "url": "http://espn.go.com",
            "category": "sports",
            "language": "en",
            "country": "us"
          },
          {
            "id": "espn-cric-info",
            "name": "ESPN Cric Info",
            "description":
                "ESPN Cricinfo provides the most comprehensive cricket coverage available including live ball-by-ball commentary, news, unparalleled statistics, quality editorial comment and analysis.",
            "url": "http://www.espncricinfo.com/",
            "category": "sports",
            "language": "en",
            "country": "us"
          },
          {
            "id": "fox-sports",
            "name": "Fox Sports",
            "description":
                "Find live scores, player and team news, videos, rumors, stats, standings, schedules and fantasy games on FOX Sports.",
            "url": "http://www.foxsports.com",
            "category": "sports",
            "language": "en",
            "country": "us"
          },
          {
            "id": "nfl-news",
            "name": "NFL News",
            "description":
                "The official source for NFL news, schedules, stats, scores and more.",
            "url": "http://www.nfl.com/news",
            "category": "sports",
            "language": "en",
            "country": "us"
          },
          {
            "id": "nhl-news",
            "name": "NHL News",
            "description":
                "The most up-to-date breaking hockey news from the official source including interviews, rumors, statistics and schedules.",
            "url": "https://www.nhl.com/news",
            "category": "sports",
            "language": "en",
            "country": "us"
          }
        ]
      });

      expect(result.first != null && result2 == result.first, true);
    });
  });
}
