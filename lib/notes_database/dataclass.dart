class NoteData {
  final String title;
  final String content;

  const NoteData({
    required this.title,
    required this.content,
  });

  static const _title = "title";
  static const _content = "content";

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      _title: title,
      _content: content,
    };
    return map;
  }

  factory NoteData.fromMap(Map<String, Object?> map) {
    return NoteData(
      title: map[_title] as String,
      content: map[_content] as String,
    );
  }
}
