import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_test/widgets/shared/hover_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 50; i++)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => print("tapped"),
                    behavior: HitTestBehavior.translucent,
                    child: OnHover(
                      builder: (hovered) {
                        return Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: hovered ? Colors.grey : Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn.domestika.org/c_limit,dpr_auto,f_auto,q_auto,w_820/v1509556098/content-items/002/130/920/23032615_1453885808063402_2233926401809156054_n-original.jpg?1509556098",
                                  placeholder: (context, url) => const SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7 - 24,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Capitan America Civil War",
                                      style: GoogleFonts.poppins(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    Text(
                                      "Volumen 15-5",
                                      style: GoogleFonts.poppins(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
