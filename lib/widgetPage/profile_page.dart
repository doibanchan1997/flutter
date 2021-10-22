import 'dart:async';

import 'package:flutter/material.dart';
import '../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StreamController myController = StreamController.broadcast();

  Widget _getBackground() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
          'https://www.teahub.io/photos/full/279-2797822_patrick-spongebob-wallpaper-patrick-star-with-cat.jpg',
        ),
        fit: BoxFit.cover,
      )),
    );
  }

  Widget _buildDevider() => Container(
        height: 26,
        child: const VerticalDivider(
          color: Colors.black,
          thickness: 2,
        ),
      );

  Widget _getContent() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height - 300,
        child: Center(
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Hao Nguyen",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(15),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.facebook_rounded,
                                      size: 40,
                                    ),
                                  )),
                              _buildDevider(),
                              const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Icon(
                                    Icons.linked_camera_outlined,
                                    size: 40,
                                  )),
                              _buildDevider(),
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.youtube_searched_for_outlined,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                _getBackground(),
              ],
            ),
            Positioned(left: 0, right: 0, bottom: 0, child: _getContent()),
            const Positioned(top: 150, left: 0, right: 0, child: AvatarWidget())
          ],
        ));
  }
}
