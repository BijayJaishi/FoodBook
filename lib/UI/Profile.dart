import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newflutter/src/read_more_text.dart';
import 'dart:math' as math;

import 'package:newflutter/utils/utils.dart';

import 'ProfileImage/imagess.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _ProfileState extends State<Profile> {
  var currentPage = imagess.length - 1.0;
  int _current = 0;
  List imgList = [
    AssetImage("assets/images/burger.jpg"),
    AssetImage("assets/images/newbackground.jpg"),
    AssetImage("assets/images/burger.jpg"),
    AssetImage("assets/images/newbackground.jpg"),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var post = 50;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/logo.png', height: 32),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Container(
              height: 30,
                width: 30,
                child: Image.asset(
              'assets/images/gears.png',
            )),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          Transaction(
              avatar: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/profilebackground.png"),
                        fit: BoxFit.scaleDown)),
                child: Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(left: 13.36, top: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.green),
                      borderRadius: BorderRadius.circular(1000.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(60, 0, 0, 0),
                            blurRadius: 3.0,
                            offset: Offset(3.0, 3.0))
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/burger.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Halfwaiter Restaurant ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                            fontFamily:'Poppins')),
                    WidgetSpan(
                      child: Icon(
                        Icons.star,
                        size: 19,
                        color: Colors.yellow,
                      ),
                    ),
                    TextSpan(
                        text: " 4.5",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins')),
                  ],
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.face, size: 18),
                    ),
                    TextSpan(
                        text: " Follow",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: "  |  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: "50 posts",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: "  |  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: "$post followers",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              )),
          SliverToBoxAdapter(
            child: getstoriess(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    "Your Posts",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0,fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return getposts();
            }, childCount: 10),
          )
        ],
      ),
    );
  }

  Widget getstoriess() {
    PageController controller = PageController(initialPage: imagess.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  "Stories Highlights",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      fontFamily: "Poppins"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CardScrollWidget(currentPage),
          ),
          Positioned.fill(
            child: PageView.builder(
              itemCount: imagess.length,
              controller: controller,
              reverse: true,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget getposts() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFF0F0F0),
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.network(
                    Utils.image(isBig: true),
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.black),
                                    child: new Icon(
                                      Icons.favorite_border,
                                      size: 23,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "124",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.black),
                                    child: new Icon(
                                      Icons.insert_comment,
                                      size: 23,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "124",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.black),
                                    child: new Icon(
                                      Icons.share,
                                      size: 23,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "124",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.black),
                                    child: new Icon(
                                      Icons.more_vert,
                                      size: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, bottom: 4.0),
                      child: ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Show more',
                        trimExpandedText: ' show less',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < imagess.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(imagess[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  )),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("Read Later",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

class Transaction extends StatelessWidget {
  final Widget avatar;
  final Widget title;
  final Widget subtitle;

  const Transaction({this.avatar, this.title, this.subtitle, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
        avatar: avatar,
        title: title,
        subtitle: subtitle,
      ),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarTween =
      SizeTween(begin: Size(135.0, 135.0), end: Size(70.0, 70.0));
  final _avatarMarginTween =
      EdgeInsetsTween(begin: EdgeInsets.zero, end: EdgeInsets.only(left: 8.0));
  final _avatarAlignTween =
      AlignmentTween(begin: Alignment.topCenter, end: Alignment.centerLeft);

  final _titleMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 110.0 + 5.0, left: 20.0),
      end: EdgeInsets.only(left: 10.0 + 80.0 + 5.0));
  final _titleAlignTween =
      AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft);

  final _subtitleMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 160.0 + 5.0),
      end: EdgeInsets.only(left: 10.0 + 70.0 + 5.0, top: 40));
  final _subtitleAlignTween =
      AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft);

  final Widget avatar;
  final Widget title;
  final Widget subtitle;

  _TransitionAppBarDelegate({this.avatar, this.title, this.subtitle})
      : assert(avatar != null),
        assert(subtitle != null),
        assert(title != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / 200.0;

    final avatarSize = _avatarTween.lerp(progress);
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);

    final titleMargin = _titleMarginTween.lerp(progress);
    final titleAlign = _titleAlignTween.lerp(progress);

    final subtitleMargin = _subtitleMarginTween.lerp(progress);
    final subtitleAlign = _subtitleAlignTween.lerp(progress);
    return Card(
      margin: EdgeInsets.all(0.0),
      elevation: 3.0,
      child: Container(
        decoration: new BoxDecoration(color: Colors.white),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: avatarMargin,
              child: Align(
                alignment: avatarAlign,
                child: SizedBox.fromSize(size: avatarSize, child: avatar),
              ),
            ),
            Padding(
              padding: titleMargin,
              child: Align(
                alignment: titleAlign,
                child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.title, child: title),
              ),
            ),
            Padding(
              padding: subtitleMargin,
              child: Align(
                alignment: subtitleAlign,
                child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.title, child: subtitle),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }
}
