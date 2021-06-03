import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  onItemChanged(String value) {
    // setState(() {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 28, right: 28),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: 15,
            ),
            SearchBox(
              onFilter: onItemChanged,
            )
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
                "Create Session",
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CheckButton(),
            ],
          )
        ],
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
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

class SearchBox extends StatefulWidget {
  SearchBox({Key? key, required this.onFilter}) : super(key: key);
  final onFilter;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: TextField(
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.surface,
          hintText: 'Game',
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          hintStyle: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
          focusColor: Theme.of(context).colorScheme.primary,
          border: InputBorder.none,
        ),
        controller: _textController,
        onChanged: widget.onFilter,
        cursorColor: Theme.of(context).colorScheme.primary,
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
