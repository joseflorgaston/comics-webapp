import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_test/models/comic.dart';
import 'package:comic_test/services/comic-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

import '../../utilities/shared_functions.dart';

class Content extends StatefulWidget {
  const Content({Key? key, required this.comicDetailUrl}) : super(key: key);

  final String comicDetailUrl;
  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool isLoading = true;
  ComicDetailsModel comic = ComicDetailsModel();

  @override
  void initState() {
    getComicDetail();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ComicDetailsSkeleton()
        : ComicDetailsWidget(
            comicDetails: comic,
          );
  }

  void getComicDetail() async {
    ComicService().getComicDetails(widget.comicDetailUrl).then((value) {
      comic = value;
      setState(() {
        isLoading = false;
      });
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
                      for (var i = 0; i < 4; i++) const InfoDetailsSkeleton(),
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
                      for (var i = 0; i < 2; i++) const InfoDetailsSkeleton(),
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
                      for (var i = 0; i < 2; i++) const InfoDetailsSkeleton(),
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
                      for (var i = 0; i < 2; i++) const InfoDetailsSkeleton(),
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

class InfoDetailsSkeleton extends StatelessWidget {
  const InfoDetailsSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class ComicDetailsWidget extends StatelessWidget {
  const ComicDetailsWidget({Key? key, required this.comicDetails})
      : super(key: key);

  final ComicDetailsModel comicDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Characters",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(),
                  CharactersList(info: comicDetails.characterCredits ?? []),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Teams",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(),
                  CharactersList(info: comicDetails.teamCredits ?? []),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Locations",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(),
                  CharactersList(info: comicDetails.locationCredits ?? []),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Concepts",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(),
                  CharactersList(
                    info: comicDetails.conceptCredits ?? [],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: HtmlElementView(
                viewType: SharedFunctions.getImage(
                  '${comicDetails.image?.originalUrl}',
                  200,
                  150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharactersList extends StatelessWidget {
  const CharactersList({Key? key, required this.info}) : super(key: key);

  final List<CharacterCredits> info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          for (var i = 0; i < info.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: HtmlElementView(
                        viewType: SharedFunctions.getImage(
                          "https://media.revistagq.com/photos/621f6d1723b7738d21d91e1d/4:3/w_1919,h_1439,c_limit/batman-uhdpaper.com-4K-17.jpg",
                          50,
                          50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${info[i].name}',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: HtmlElementView(
            viewType: SharedFunctions.getImage(
              "https://media.revistagq.com/photos/621f6d1723b7738d21d91e1d/4:3/w_1919,h_1439,c_limit/batman-uhdpaper.com-4K-17.jpg",
              50,
              05,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Batman",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
