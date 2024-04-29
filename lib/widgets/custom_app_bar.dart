import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clon/assets.dart';
import 'package:netflix_clon/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double ScrollOfset;
  const CustomAppBar({super.key, required this.ScrollOfset});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        color: Colors.black
            .withOpacity((ScrollOfset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
            mobile: _CustomAppBarMobile(), desktop: _CustomAppBarDesktop()));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "Tv Show",
                  onTap: () => "TV Show",
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () => "Movies",
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () => "My List",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _AppBarButton(
                  title: "home",
                  onTap: () => "Home",
                ),
                _AppBarButton(
                  title: "Tv Show",
                  onTap: () => "TV Show",
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () => "Movies",
                ),
                _AppBarButton(
                  title: "Latest",
                  onTap: () => "Latest",
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () => "My List",
                )
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: () => print("search"),
                ),
                _AppBarButton(
                  title: "Kids",
                  onTap: () => "Kids",
                ),
                _AppBarButton(
                  title: "DVD",
                  onTap: () => "DVD",
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: () => print("Gift"),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: () => print("Notification"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const _AppBarButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
