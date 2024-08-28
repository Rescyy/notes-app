import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/cupertino.dart';

class CupertinoNotesDeleteDialogModel extends StatelessWidget {
  const CupertinoNotesDeleteDialogModel({
    super.key,
    required this.onDelete,
    required this.topText,
    required this.warning,
  });

  final void Function() onDelete;
  final String topText;
  final String warning;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(topText),
      content: Text(warning),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: Text(
            'Yes',
            style: TextStyle(
              color: NotesPallette.of(context).cupertinoDialogActionNegative,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: Text(
            'No',
            style: TextStyle(
              color: NotesPallette.of(context).cupertinoDialogActionPositive,
            ),
          ),
        ),
      ],
    );
  }
}
