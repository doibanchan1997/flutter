import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);
  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  Widget _getAvatar() {
    return CircleAvatar(
        backgroundColor: Colors.black,
        radius: 50,
        child: ClipOval(
            child: Image.network(
          'https://www.greenpet.com.au/wp-content/uploads/2016/07/Cat-Food-Treats-300x300.jpg',
          fit: BoxFit.cover,
        )));
  }

  Widget buildEditIcon() {
    return buidCircle(
        child: const Icon(
      Icons.edit,
      color: Colors.white,
      size: 15,
    ));
  }

  Widget buidCircle({required Widget child}) {
    return ClipOval(
        child: Container(
            color: Colors.blue,
            child: child,
            padding: const EdgeInsets.all(8)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        _getAvatar(),
        Positioned(bottom: 0, right: 4, child: buildEditIcon()),
      ],
    ));
  }
}
