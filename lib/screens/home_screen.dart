import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clon/cubits/cubits.dart';
import 'package:netflix_clon/data/data.dart';

import '../widgets/content_list.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _ScrollController;

  @override
  void initState() {
    _ScrollController = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_ScrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _ScrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        onPressed: () => print("cast"),
      ),
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 55),
          child: BlocBuilder<AppBarCubit, double>(
            builder: (context, scrollOffset) {
              return CustomAppBar(
                ScrollOfset: scrollOffset,
              );
            },
          )),
      body: CustomScrollView(
        controller: _ScrollController,
        slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(featureContent: sintelContent)),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('myList'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
              title: 'Netflix Orignal',
              contentList: originals,
              isOrignals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('trending'),
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
