import 'package:comic_test/blocs/list_mode_bloc.dart';
import 'package:comic_test/widgets/shared/hover_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/comic.dart';
import '../../utilities/shared_functions.dart';
import '../../utilities/view_mode.dart';

class ComicWidget extends StatelessWidget {
  const ComicWidget({Key? key, required this.comics}) : super(key: key);

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
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        for (var index = 0; index < comics.length; index++)
          GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
              height: 450,
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width * 0.2),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 400,
                    child: HtmlElementView(
                      viewType: SharedFunctions.getImage(
                          comics[index].image.originalUrl, 150, 200),
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
