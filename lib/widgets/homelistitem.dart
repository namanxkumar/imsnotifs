import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ListItem extends StatelessWidget {
  ListItem(
      this.game, this.group, this.button, this.start, this.end, this.color);

  final String game;
  final String group;
  final int button;
  final String start;
  final String end;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 137,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    start,
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Text(
                    end,
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: 137,
                width: 250,
                child: Stack(
                  children: [
                    Container(
                      height: 137,
                      width: 250,
                      decoration: button == 1
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context).colorScheme.secondary
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              // color: Theme.of(context).colorScheme.surface,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black,
                              //     offset: const Offset(0, 1),
                              //     blurRadius: 2.0,
                              //   )
                              // ],
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Theme.of(context).colorScheme.surface,
                              // color: Theme.of(context).colorScheme.surface,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black,
                              //     offset: const Offset(0, 1),
                              //     blurRadius: 2.0,
                              //   )
                              // ],
                            ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 0.0, bottom: 4.0),
                              child: Text(
                                game,
                                style: GoogleFonts.poppins(
                                    color: button == 1
                                        ? Theme.of(context).colorScheme.surface
                                        : Theme.of(context).colorScheme.primary,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              group,
                              style: GoogleFonts.poppins(
                                  color: button == 1
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                          child: button == 0
                              ? AddButton()
                              : (button == 1 ? AddedButton() : EditButton()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  // final onTodayPress;
  // GreenButton(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 40.0,
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
      height: 40.0,
      width: 40.0,
      child: Container(
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Icon(
              Icons.check,
              size: 26,
              color: Theme.of(context).colorScheme.surface,
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
      height: 40.0,
      width: 40.0,
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
