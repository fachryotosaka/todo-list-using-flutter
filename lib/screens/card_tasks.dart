import 'package:flutter/material.dart';
import 'package:todo_list/model/note.dart';

class CardTasks extends StatelessWidget {
  Note taskuser;
  bool isActive;

  int Index;
  final colorIcon = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange
  ];
  ValueChanged<Note> onSelected;

  CardTasks(
      {Key? key,
      required this.taskuser,
      required this.isActive,
      required this.Index,
      // required this.animation,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = colorIcon[Index % colorIcon.length];
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                  onTap: () => onSelected(taskuser),
                  child: isActive
                      ? const Icon(Icons.check_circle_outlined,
                          color: Colors.grey)
                      : Icon(
                          Icons.circle_outlined,
                          color: color,
                        ),
                )),
            SizedBox(
              width: we * 0.025,
            ),
            Expanded(
                child: Text(taskuser.description,
                    // maxLines: 20,
                    // overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      // ignore: unrelated_type_equality_checks
                      decoration: isActive
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    )))
          ],
        ),
      ),
    );
  }
}
