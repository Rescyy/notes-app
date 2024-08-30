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
          child: const Text(
            'Yes',
            style: TextStyle(
              color: CupertinoColors.systemRed,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: const Text(
            'No',
            style: TextStyle(
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
      ],
    );
  }
}
