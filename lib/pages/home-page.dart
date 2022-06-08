import 'package:flutter/material.dart';

import '../widgets/home_page/book_list.dart';
import '../widgets/home_page/page_title.dart';
import '../widgets/home_page/home_page_header.dart';
import '../widgets/shared/background.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: const [
            PageTitle(),
            HomePageHeader(),
            Divider(
              color: Colors.orange,
            ),
            BookList(),
          ],
        ),
      ),
    );
  }
}
