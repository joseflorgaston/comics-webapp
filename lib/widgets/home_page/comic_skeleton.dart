import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ComicsSkeleton extends StatefulWidget {
  const ComicsSkeleton({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  @override
  State<ComicsSkeleton> createState() => _ComicsSkeletonState();
}

class _ComicsSkeletonState extends State<ComicsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i < 28; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Column(
              children: [
                Skeleton(
                  skeleton: Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  isLoading: widget.isLoading,
                  child: Container(
                    height: 0,
                    width: 0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
