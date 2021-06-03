import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:testproj/widgets/grouplistitem.dart';

class GroupsScreen extends StatefulWidget {
  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  static List<Map> groups = [
    {
      "group": "Rudimentary Gaming",
      "nmembers": 30,
      "color": 0xffDA7E70,
      "image": "https://placedog.net/150/150?random",
    },
    {
      "group": "NASA Gang",
      "nmembers": 12,
      "color": 0xffC1D4B6,
      "image": "https://placedog.net/150/150?random",
    },
    {
      "group": "YeRt",
      "nmembers": 4,
      "color": 0xffFBDEAC,
      "image": "https://placedog.net/150/150?random",
    },
    {
      "group": "Procrastination 100",
      "nmembers": 3,
      "color": 0xffF4B6B0,
      "image": "https://placedog.net/150/150?random",
    }
  ];

  List<Map> groupsfiltered = List.from(groups);

  onItemChanged(String value) {
    setState(() {
      groupsfiltered = groups
          .where(
              (map) => map["group"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 28, right: 28),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 15.0),
            SearchBox(onFilter: onItemChanged),
            SizedBox(height: 15.0),
            GroupsList(data: groupsfiltered),
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
                "Groups",
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      GreenButton(),
                      SizedBox(width: 10),
                      AddButton(),
                    ],
                  ),
                ],
              ), //ontodaypress
            ],
          )
        ],
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  // final onTodayPress;
  // Greencolor(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          TextButton.icon(
            icon: Icon(Icons.expand_more),
            style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                primary: Theme.of(context).colorScheme.primary,
                textStyle: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                )),
            label: Text('Sort '),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  // final onTodayPress;
  // Greencolor(this.onTodayPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      width: 47.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.3,
          ),
        ),
        child: Material(
          color: Color.fromRGBO(166, 92, 232, .1),
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
          borderRadius: BorderRadius.circular(8), color: Color(0xff181818)),
      child: TextField(
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          fillColor: Color(0xff181818),
          hintText: 'Search',
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

class GroupsList extends StatefulWidget {
  const GroupsList({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: widget.data.length,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) {
            return ListItem(
              widget.data[index]["nmembers"],
              widget.data[index]["group"],
              widget.data[index]["color"],
              widget.data[index]["image"],
            );
          },
        ),
      ),
    );
  }
}
