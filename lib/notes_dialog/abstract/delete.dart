import 'package:flutter/widgets.dart';

abstract class AbstractNotesDeleteDialog extends StatelessWidget {
  const AbstractNotesDeleteDialog({
    super.key,
    required this.onDelete,
    required this.warning,
    required this.topText,
  });

  final String topText;
  final String warning;
  final void Function() onDelete;
}
