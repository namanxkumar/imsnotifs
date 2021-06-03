import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ListItem extends StatelessWidget {
  ListItem(this.nmembers, this.group, this.color, this.image);

  final int nmembers;
  final String group;
  final int color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              width: 260,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.surface,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black,
                //     offset: const Offset(0, 1),
                //     blurRadius: 2.0,
                //   )
                // ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      group,
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 15.0),
          child: Container(
            height: 50,
            width: 50,
            child: EditButton(color),
          ),
        )
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  EditButton(this.color);
  final int color;
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Material(
        color: Color(color),
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Icon(
            LineIcons.pen,
            size: 26,
            color: Color(0xff181818),
          ),
          // splashColor: Color(0xff000000),
          onTap: () {},
        ),
      ),
    );
  }
}
