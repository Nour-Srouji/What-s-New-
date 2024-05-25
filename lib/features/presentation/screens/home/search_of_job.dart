import 'package:flutter/material.dart';

class SearchOfJob extends StatefulWidget {
  const SearchOfJob({Key? key}) : super(key: key);

  @override
  State<SearchOfJob> createState() => _SearchOfJobState();
}

class _SearchOfJobState extends State<SearchOfJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.only(left: 220),
              child: Text(
                'Jobs',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(300, 100),
                    bottomRight: Radius.elliptical(300, 100))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          SizedBox(height: 50),
          InkWell(
            ////***************/SearchOfJob
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SearchOfJob()));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              width: 200,
              height: 50,
              child: const Center(
                  child: Text("Search Of Job",
                      style: TextStyle(color: Colors.white, fontSize: 25))),
            ),
          ),
/*************************************************************************************** */

          SizedBox(height: 50),
          InkWell(
            ////////////////**************** Work Avaliable
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SearchOfJob()));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              width: 200,
              height: 50,
              child: const Center(
                  child: Text("Work Available ",
                      style: TextStyle(color: Colors.white, fontSize: 25))),
            ),
          ),
        ],
      ),
    );
  }
}
