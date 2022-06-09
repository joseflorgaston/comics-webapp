import 'package:comic_test/models/comic.dart';
import 'package:comic_test/services/comic-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'comic_skeleton.dart';
import 'comic_list.dart';

class Content extends StatefulWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool isLoading = true;
  List<Comic> comics = [];

  @override
  void initState() {
    getComics();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.width * 0.03 + 161),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            isLoading
                ? ComicsSkeleton(
                    isLoading: isLoading,
                  )
                : ComicList(
              comics: comics,
            ),
          ],
        ),
      ),
    );
  }


  void getComics() async {
    ComicListResponse response = await ComicService().getComics();
    setState(() {
      comics = response.comicsList;
      isLoading = false;
    });
  }
}
