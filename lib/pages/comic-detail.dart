
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/comic_detail_page/comic_detail_content.dart';
import '../widgets/home_page/page_title.dart';
import '../widgets/shared/background.dart';

class ComicDetail extends StatelessWidget {
  const ComicDetail({Key? key, required this.comicDetailUrl}) : super(key: key);

  final String comicDetailUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            const PageTitle(),
            const Divider(color: Colors.orange,),
            Content(comicDetailUrl: comicDetailUrl,),
          ],
        ),
      ),
    );
  }


}