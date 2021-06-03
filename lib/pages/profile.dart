import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 28, right: 28),
        child: Column(
          children: [
            CustomAppBar(), //onToday
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  // final onTodayPress;
  // CustomAppBar(this.onTodayPress);

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
              Text(
                "Profile",
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              EditButton()
            ],
          )
        ],
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
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            // customBorder: ,
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
