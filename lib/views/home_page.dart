import 'package:daily_news/views/category_bottom_view.dart';
import 'package:daily_news/widgets/bottom_bar.dart';
import 'package:daily_news/widgets/common_widgets.dart';
import 'package:daily_news/widgets/top_news_view.dart';
import 'package:flutter/material.dart';

final List<Widget> _page = <Widget>[
  topListView(),
  EmptyView(Category: "lifestyle", Lang: "en"),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void onTapped(int index) {
    if (index == 3 || index == 2) {
      showFeatureMessage(context);
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      centerTitle: true,
      elevation: 0, 
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Da',
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 27,
            ),
          ),
          Icon(Icons.podcasts, color: Colors.red),
          Text(
            'ly News',
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 27,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),

      body: _page.elementAt(selectedIndex),

      bottomNavigationBar: customBottomWidget(
        selectedIndex: selectedIndex,
        onItemTapped: onTapped,
      ),
    );
  }
}
