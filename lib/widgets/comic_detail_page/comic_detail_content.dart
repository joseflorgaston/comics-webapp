import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_test/models/comic.dart';
import 'package:comic_test/services/comic-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

class Content extends StatefulWidget {
  const Content({Key? key, required this.comicDetailUrl}) : super(key: key);

  final String comicDetailUrl;
  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool isLoading = false;
  late ComicDetailsModel comic;

  @override
  void initState() {
    // getComicDetail();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          isLoading ? const ComicDetailsSkeleton() : const ComicDetailsWidget(),
    );
  }

  void getComicDetail() async {
    comic = await ComicService().getComicDetails(widget.comicDetailUrl);
    setState(() {
      isLoading = false;
    });
  }
}

class ComicDetailsSkeleton extends StatelessWidget {
  const ComicDetailsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(
              skeleton: Text(
                "Characters",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isLoading: true,
              child: const SizedBox(),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6 -
                      (MediaQuery.of(context).size.width * 0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < 4; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      Skeleton(
                        skeleton: Text(
                          "Teams",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isLoading: true,
                        child: const SizedBox(),
                      ),
                      const Divider(),
                      for (var i = 0; i < 2; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      Skeleton(
                        skeleton: Text(
                          "Locations",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isLoading: true,
                        child: const SizedBox(),
                      ),
                      const Divider(),
                      for (var i = 0; i < 2; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      Skeleton(
                        skeleton: Text(
                          "Concepts",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isLoading: true,
                        child: const SizedBox(),
                      ),
                      const Divider(),
                      for (var i = 0; i < 2; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                                Skeleton(
                                  isLoading: true,
                                  skeleton: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                Skeleton(
                  skeleton: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.75,
                  ),
                  isLoading: true,
                  child: const SizedBox(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ComicDetailsWidget extends StatelessWidget {
  const ComicDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
