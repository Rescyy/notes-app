class NotesScrollbarModel extends StatelessWidget {
  const NotesScrollbarModel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.scrollKey,
  });

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thickness: 8,
      radius: const Radius.circular(5),
      thumbVisibility: true,
      trackColor: NotesPallette.cardIcon,
      thumbColor: NotesPallette.cardIcon,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
            child: ListView.separated(
              key: scrollKey,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    NotesPallette.background,
                    NotesPallette.backgroundTransparent
                  ],
                ),
              ),
              height: 10,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    NotesPallette.background,
                    NotesPallette.backgroundTransparent
                  ],
                ),
              ),
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}