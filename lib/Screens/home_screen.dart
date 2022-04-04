import 'package:awsome_note/Components/side_menu.dart';
import 'package:awsome_note/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

late SharedPreferences prefs;

class _HomeScreenState extends State<HomeScreen> {
  setNote(String note) async {
    Constants.notes!.add(note);
    await prefs.setStringList('notes', Constants.notes!);
  }

  sharedAsync() async {
    prefs = await SharedPreferences.getInstance();
  }

  TextEditingController note = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      await sharedAsync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Constants.notes!.length,
              itemBuilder: (context, ind) {
                return Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    dismissible: DismissiblePane(onDismissed: () {
                      setState(() async {
                        Constants.notes!.removeAt(ind);
                        await prefs.setStringList('notes', Constants.notes!);
                      });
                    }),
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (c) {
                          setState(() {
                            Constants.notes!.removeAt(ind);
                          });
                        },
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                        flex: 2,
                      ),
                      SlidableAction(
                        onPressed: (c) {},
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.green,
                        icon: Icons.share,
                        label: 'Edit',
                        flex: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Text(Constants.notes![ind],
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: TextField(
              controller: note,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: TextButton(
                  onPressed: () async {
                    setState(() {
                      setNote(note.text);
                      note.text = '';
                    });
                  },
                  child: Icon(Icons.send),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
