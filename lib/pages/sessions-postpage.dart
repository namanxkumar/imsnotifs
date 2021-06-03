import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SessionDetailPage extends StatelessWidget {
  const SessionDetailPage({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 28, right: 28),
        child: Column(
          children: [
            CustomAppBar(data["button"]),
            SizedBox(
              height: 15,
            ),
            Text(data["title"])
          ],
        ),
      )),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  // final onTodayPress;
  // CustomAppBar(this.onTodayPress);
  final button;
  CustomAppBar(this.button);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(),
              button == 1
                  ? AddedButton()
                  : (button == 0 ? AddButton() : EditButton())
            ],
          ),
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 22,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          // splashColor: Color(0xff000000),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      width: 47.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // border: Border.all(
          //   color: Color(0xffA65CE8),
          // ),
        ),
        child: Material(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Icon(
              LineIcons.plus,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            // splashColor: Color(0xff000000),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

class AddedButton extends StatelessWidget {
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      width: 47.0,
      child: Container(
        child: Material(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Icon(
              Icons.check,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            // splashColor: Color(0xff000000),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      width: 47.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Material(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Icon(
              LineIcons.pen,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            // splashColor: Color(0xff000000),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
