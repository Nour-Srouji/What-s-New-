import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/widgets/show_variable.dart';
import 'package:news_app/features/presentation/bloc/every_thing_cubit.dart';
import 'package:news_app/features/presentation/bloc/tob_headlins_cubit.dart';
import 'package:news_app/features/presentation/widgets/every_thing_tab.dart';
import 'package:news_app/features/presentation/widgets/top_headlins_tab.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  @override
  State<HomeMobile> createState() {
    return _HomeMobileState();
  }
}

class _HomeMobileState extends State<HomeMobile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  //كلاس خاص بالدارت وهو تصريح عن مفتاح لكل عقدةبالشجرة لمعرفة حالة العقدة او الترتيب بينها وبين عقدة اخرىو  يمكن الوصول للمفتاح  من اي مكان بالشجرة
  ShowVariables _show = ShowVariables(q: "");
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //FOR organization tabBar
      length: 2,
      child: SafeArea(
          child: Scaffold(
              key: _key,
              body: ChangeNotifierProvider(
                create: (BuildContext context) => _show,
                child: Column(
                  children: [
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 5),
                                child: TextField(
                                  controller: _searchController,
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Search...',
                                    hintStyle: TextStyle(color: Colors.white54),
                                    border: InputBorder.none,
                                  ),
                                  // onChanged: (value) {
                                  //   // Perform search functionality here

                                  // },
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _show.q = _searchController.text;
                              },
                              icon: const Icon(Icons.search),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                        )),

                    //////////////////////////
                    const TabBar(
                      tabs: [
                        Tab(
                            child: Text(
                          "Every Thing",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        )),
                        Tab(
                            child: Text(
                          "Top Headlinse",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        )),
                      ],
                      indicator: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black),
                      )),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          BlocProvider(
                            create: (_) => EveryThingCubit(),
                            child: EveryThingTab(),
                          ),
                          BlocProvider(
                              create: (_) => TopHeadlinsCubit(),
                              child: TopHeadlinsTab())
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
