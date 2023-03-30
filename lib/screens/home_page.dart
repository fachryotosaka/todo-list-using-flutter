import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_list/Animation/fadeAnimation.dart';
import 'package:todo_list/Animation/linearprogress.dart';
import 'package:todo_list/custom_text.dart';
import 'package:todo_list/data/shared/Task_saved.dart';
import 'package:todo_list/data/tasks.dart';
import 'package:todo_list/db/notes_database.dart';
import 'package:todo_list/model/note.dart';
import 'package:todo_list/screens/card_tasks.dart';
import 'package:todo_list/screens/note_task.dart';

class HomePage extends StatefulWidget {
  VoidCallback opendrawer;
  HomePage({super.key, required this.opendrawer});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> all_selected_tasks = []; // your tasks

  List<Note> notes = []; // get info from Database and add to this list

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    all_selected_tasks = TaskerPreference.getString() ?? [];
    super.initState();
    refreshNote();
  }

  @override
  void dispose() {
    // TODO: close Database of Note ...
    NotesDatabase.instance.close();
    super.dispose();
  }

  // Todo for load notd from Database ..
  Future refreshNote() async {
    setState(() => true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => false);
  }

  Icon customIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              padding: const EdgeInsets.fromLTRB(0, 15, 30, 0),
              color: Colors.grey[400],
              onPressed: () {},
              iconSize: 25,
              icon: const Icon(Icons.search_rounded),
            )
          ],
          leading: IconButton(
            padding: const EdgeInsets.fromLTRB(20, 13, 20, 0),
            color: Colors.grey[400],
            onPressed: widget.opendrawer,
            iconSize: 20,
            icon: const Icon(Icons.more_vert),
          ),
          centerTitle: true,
          backgroundColor: Colors.white12,
        ),
      ),
      body: Container(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: 160,
              margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 45),
                  CustomText(
                      text: "What’s Up, Lexa!",
                      color: Color.fromARGB(221, 29, 29, 29),
                      fontSize: 35,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: 30),
                  CustomText(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      text: "CATEGORIES",
                      color: Colors.black26,
                      fontSize: 11,
                      fontWeight: FontWeight.w900),
                ],
              ),
            ),
            FadeAnimation(
              // Total Tasks
              delay: 1,
              child: SizedBox(
                width: we * 2,
                height: he * 0.11,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tasklist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(left: 23),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Container(
                        width: we * 0.5,
                        height: he * 0.1,
                        margin: const EdgeInsets.only(
                          top: 18,
                          left: 14,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${notes.length.toString()} tasks",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.9)),
                            ),
                            SizedBox(
                              height: he * 0.01,
                            ),
                            Text(
                              tasklist[index].title,
                              style: const TextStyle(
                                fontSize: 23,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: he * 0.02),
                            Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: LineProgress(
                                  value: notes.length.toDouble(),
                                  Color: tasklist[index].progresscolor,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Container(
              // height: 160,
              margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 45),
                  CustomText(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      text: "TODAY-TASK",
                      color: Colors.black26,
                      fontSize: 11,
                      fontWeight: FontWeight.w900),
                ],
              ),
            ),
            SizedBox(height: he * 0.02),

            FadeAnimation(
                delay: 1,
                child: SizedBox(
                    width: we * 0.9,
                    height: he * 0.4,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : notes.isEmpty
                            ? Container(
                                alignment: Alignment.center,
                                child: const Text("no tasks",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black26,
                                    )))
                            : ListView(
                                physics: const BouncingScrollPhysics(),
                                children: notes.map((note) {
                                  final IsSelected = all_selected_tasks
                                      .contains(note.description);

                                  return Slidable(
                                      endActionPane: ActionPane(
                                        // A motion is a widget used to control how the pane animates.
                                        motion: const StretchMotion(),

                                        // A pane can dismiss the Slidable.

                                        // All actions are defined in the children parameter.
                                        children: [
                                          // A SlidableAction can have an icon and/or a label.
                                          SlidableAction(
                                            onPressed: (context) async {
                                              NotesDatabase.instance
                                                  .delete(note.id!);
                                              refreshNote();
                                            },
                                            backgroundColor:
                                                const Color(0xFFFE4A49),
                                            icon: Icons.delete,
                                          ),

                                        ],
                                      ),
                                      child: builditem(note, IsSelected));
                                }).toList()))),
          ],
        ),
      ),
      floatingActionButton: FadeAnimation(
        delay: 1.2,
        child: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(PageTransition(
                type: PageTransitionType.fade, child: const Note_Task()));
            refreshNote();
          },
          backgroundColor:Color(0xFF00FFB2),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // TODO : Tasks Items ...
  Widget builditem(Note item, IsSelected) {
    return Card(
      margin: const EdgeInsets.only(left: 30, right:30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      elevation: 0,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Stack(
        children: [
          CardTasks(
            Index: item.id!,
            onSelected: (tasks) async {
              setState(() {
                IsSelected
                    ? all_selected_tasks.remove(item.description)
                    : all_selected_tasks.add(item.description);
              });
              TaskerPreference.setStringList(all_selected_tasks);
            },
            isActive: IsSelected,
            taskuser: item,
          )
        ],
      ),

    );
  }
}
