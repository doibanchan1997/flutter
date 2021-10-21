import 'package:flutter/material.dart';
import '../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _getBackground() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
          'https://www.teahub.io/photos/full/279-2797822_patrick-spongebob-wallpaper-patrick-star-with-cat.jpg',
        ),
        fit: BoxFit.cover,
      )),
    );
  }

  Widget _getContent() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height - 300,
    );
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
            Positioned(top: 150, left: 0, right: 0, child: AvatarWidget())
          ],
        )

        // Container(
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     children: <Widget>[
        //       Column(
        //         children: [
        //           Flexible(
        //             child: Container(
        //               width: MediaQuery.of(context).size.width,
        //               height: MediaQuery.of(context).size.height,
        //               decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                 image: NetworkImage(
        //                   'https://www.teahub.io/photos/full/279-2797822_patrick-spongebob-wallpaper-patrick-star-with-cat.jpg',
        //                 ),
        //                 fit: BoxFit.cover,
        //               )),
        //             ),
        //             flex: 1,
        //           ),
        //           Positioned(
        //               right: 0,
        //               child: CircleAvatar(
        //                 backgroundColor: Colors.black,
        //                 radius: 50,
        //                 child: ClipOval(
        //                     child: Image.network(
        //                   'https://www.greenpet.com.au/wp-content/uploads/2016/07/Cat-Food-Treats-300x300.jpg',
        //                   width: 100,
        //                   height: 100,
        //                   fit: BoxFit.cover,
        //                 )),
        //               )),
        //           Flexible(
        //             child: Icon(
        //               Icons.adb_sharp,
        //               size: 50,
        //             ),
        //             flex: 3,
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
