import 'package:awsome_note/Utils/constants.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        children: <Widget>[
          Text(
            'Font Size',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Colors',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.colorInd = 0;
                    });
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.colorInd = 1;
                    });
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.yellow,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.colorInd = 2;
                    });
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.colorInd = 3;
                    });
                  },
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
