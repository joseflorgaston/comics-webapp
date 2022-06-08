import 'package:comic_test/blocs/list_mode_bloc.dart';
import 'package:comic_test/utilities/view_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  bool _isGrid = true;

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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            "Latest Issues",
            style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            children: [
              IconButton(
                color: _isGrid ? Colors.orange : Colors.white,
                onPressed: () {
                  setState(() {
                    _isGrid = true;
                  });
                  context.read<ListModeBloc>().add(const ChangeMode(viewMode: Mode.grid),);
                },
                icon: const Icon(
                  CupertinoIcons.circle_grid_3x3,
                ),
              ),
              IconButton(
                color: !_isGrid ? Colors.orange : Colors.white,
                onPressed: () {
                  setState(() {
                    _isGrid = false;
                  });
                  context.read<ListModeBloc>().add(
                        const ChangeMode(viewMode: Mode.list),
                      );
                },
                icon: const Icon(
                  CupertinoIcons.list_bullet,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
