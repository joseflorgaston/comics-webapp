import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_test/blocs/list_mode_bloc.dart';
import 'package:comic_test/utilities/app_colors.dart';
import 'package:comic_test/widgets/shared/hover_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/comic.dart';
import '../../pages/comic-detail.dart';
import '../../utilities/shared_functions.dart';
import '../../utilities/view_mode.dart';

class ComicList extends StatelessWidget {
  const ComicList({Key? key, required this.comics}) : super(key: key);

  final List<Comic> comics;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListModeBloc, ListModeState>(
      builder: (context, state) {
        if (state is ListModeInitial) {
          return state.viewMode == Mode.list
              ? ListModeView(
                  comics: comics,
                )
              : GridModeView(
                  comics: comics,
                );
        }
        return const CircularProgressIndicator(
          color: Colors.white,
        );
      },
    );
  }
}

class ListModeView extends StatelessWidget {
  const ListModeView({Key? key, required this.comics}) : super(key: key);
  final List<Comic> comics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        for (var index = 0; index < comics.length; index++)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  print(comics[index].apiDetailUrl);
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicDetail(
                        comicDetailUrl: comics[index].apiDetailUrl,
                      ),
                    ),
                  );*/
                },
                behavior: HitTestBehavior.translucent,
                child: OnHover(builder: (hovered) {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width * 0.2 + 24),
                    decoration: BoxDecoration(
                      color: hovered ? Colors.grey : AppColors.getBackground(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: HtmlElementView(
                            viewType: SharedFunctions.getImage(
                              comics[index].image.originalUrl,
                              200,
                              150,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width * 0.2 + 224),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${comics[index].volume.name} ${comics[index].issueNumber}",
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${comics[index].volume.name} ${comics[index].issueNumber}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

        /*Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.1),
              ),
              alignment: Alignment.center,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width * 0.2),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 200,
                          child: HtmlElementView(
                            viewType: SharedFunctions.getImage(
                              comics[index].image.originalUrl,
                              200,
                              150,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width * 0.2 + 301),
                          child: Column(
                            children: [
                              Text(
                                "${comics[index].volume.name} ${comics[index].issueNumber}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${comics[index].volume.name} ${comics[index].issueNumber}",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),*/
      ],
    );
  }
}

class GridModeView extends StatelessWidget {
  const GridModeView({Key? key, required this.comics}) : super(key: key);

  final List<Comic> comics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var index = 0; index < comics.length; index++)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 10,
            ),
            child: OnHover(
              builder: (isHovered) {
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 150,
                          height: 200,
                          child: HtmlElementView(
                            viewType: SharedFunctions.getImage(
                                comics[index].image.originalUrl, 150, 200),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "${comics[index].volume.name} ${comics[index].issueNumber}",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          comics[index].dateAdded,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
