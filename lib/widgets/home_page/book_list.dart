import 'package:comic_test/models/comic.dart';
import 'package:comic_test/services/comic-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'comic_skeleton.dart';
import 'comic_widget.dart';

class BookList extends StatefulWidget {
  const BookList({
    Key? key,
  }) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
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
                : ComicWidget(
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
