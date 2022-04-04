import 'package:awsome_note/Screens/home_screen.dart';
import 'package:awsome_note/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Components/side_menu.dart';

late List<Object> s;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('notes')) {
    Constants.notes = prefs.getStringList('notes');
  }

  runApp(MyApp());
}

GlobalKey<ScaffoldState> _key = GlobalKey();
List hashtags = ['All Notes'];
List<DropdownMenuItem<String>> _dropDownMenuItems = [];
String _currentHashtag = '';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _icon(IconData icon, {Color color = Colors.blue}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: InkWell(
        onTap: () {
          _key.currentState!.openDrawer();
        },
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String city in hashtags) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(DropdownMenuItem(value: city, child: Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String? selectedCity) {
    // print("Selected city $selectedCity, we are going to refresh the UI");
    setState(() {
      _currentHashtag = selectedCity!;
    });
  }

  ThemeData th = Constants().themData(0);
  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems = getDropDownMenuItems();
    _currentHashtag = _dropDownMenuItems[0].value!;
    super.initState();
  }

  Widget DrNab() {
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
            style: th.textTheme.headline4,
          ),
          Text(
            'Colors',
            style: th.textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.colorInd = 0;
                      th = Constants().themData(Constants.colorInd);
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
                      th = Constants().themData(Constants.colorInd);
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
                      th = Constants().themData(Constants.colorInd);
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
                      th = Constants().themData(Constants.colorInd);
                    });
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.colorInd = 4;
                      th = Constants().themData(Constants.colorInd);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: th,
      home: Scaffold(
        key: _key,
        drawer: DrNab(),
        appBar: AppBar(
          leading: _icon(Icons.menu, color: Colors.white),
          title: TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  style: Theme.of(context).textTheme.headline5,
                  dropdownColor: Colors.black54,
                  value: _currentHashtag,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
                GestureDetector(
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
