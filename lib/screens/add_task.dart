import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_list/screens/note_task.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00FFB2),
              foregroundColor: Colors.grey.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          onPressed: () async {
            await Navigator.of(context).push(PageTransition(
                type: PageTransitionType.fade, child: const Note_Task()));
          },
          child: const Icon(
            Icons.add,
            size: 30,
          )),
    );
  }
}

    // return Consumer<AppViewModel>(builder: (context, viewModel, child) {
     
    // });
