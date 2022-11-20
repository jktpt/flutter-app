import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
  1. Tweet รูปภาพและข้อความ แยกได้
  2. แก้ข้อความชื่อ แก้ Account  ♥♥

*/
class Tweet extends StatelessWidget {
  final String avatar_url;
  final String postText;
  final String name;
  final String accountId;
  final String image_introduce;

  const Tweet(
      {super.key,
      required this.avatar_url,
      required this.postText,
      required this.name,
      required this.accountId,
      required this.image_introduce});

  @override
  Widget build(BuildContext context) {
    return tweet();
  }

  Widget tweetAvatar() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatar_url),
        )
      ]),
    );
  }

  Widget tweet() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tweetAvatar(),
        tweetBody(),
      ],
    );
  }

  Widget isImage() {
    if (image_introduce == "") {
      return Text(postText);
    } else {
      return tweetImage(postText);
    }
  }

  Widget tweetBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tweetHeader(),
          isImage(),
          // tweetImage(postText),
          tweetButton(),
        ],
      ),
    );
  }

  Widget tweetText(String text) {
    return Text(text);
  }

  Widget tweetButton() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tweetIconButton(FontAwesomeIcons.message, "22k"),
          tweetIconButton(FontAwesomeIcons.retweet, ""),
          tweetIconButton(FontAwesomeIcons.heart, "345k"),
          tweetIconButton(FontAwesomeIcons.share, ""),
        ],
      ),
    );
  }

  Widget tweetImage(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 15.0,
        ),
        Image(width: 600.0, image: NetworkImage(image_introduce))
      ],
    );
  }

  Widget tweetIconButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 18.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 6.0),
          child: Text(text, style: TextStyle(color: Colors.grey)),
        )
      ],
    );
  }

  Widget tweetHeader() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.0),
          child: Text(
            name,
            // "Engineering",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          accountId,
          // "@BUEN 10s",
          style: TextStyle(color: Colors.grey),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.angleDown,
              size: 14.0,
              color: Colors.grey,
            ))
      ],
    );
  }
}
