import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

class Bugger {
  static const String warningColor = '\x1B[31;1m';
  static const String reset = '\x1B[0m';
  static const int maxValueWidth = 100;

  static void log(String? title) {
    if (!kDebugMode) return;
    final trace = Trace.current(1);
    final frame = trace.frames.firstWhere((f) => !f.uri.toString().contains('bugger'),
      orElse: () => trace.frames.first,
    );

    final filePath = frame.uri.toString();
    final fileName = frame.uri.pathSegments.isNotEmpty ? frame.uri.pathSegments.last : 'unknown';
    final line = frame.line ?? 0;
    final method = frame.member ?? 'unknown';

    final rows = [
      ["📍 Issue", title],
      ["📄 File", fileName],
      ["📌 Line", "$line"],
      ["🔧 Method", method],
      ["🔗 Location", "$filePath : At line - $line"],
      ["🌐 GitHub", "https://github.com/rahmanprofile/bugger.git"],
    ];

    final fieldWidth = rows.fold(0, (w, r) => r[0]!.length > w ? r[0]!.length : w);

    List<String> wrapValue(String value) {
      if (value.length <= maxValueWidth) return [value];
      final lines = <String>[];
      int start = 0;
      while (start < value.length) {
        int end = (start + maxValueWidth < value.length) ? start + maxValueWidth : value.length;
        lines.add(value.substring(start, end));
        start = end;
      }
      return lines;
    }

    List<List<String>> wrapRows() {
      final wrapped = <List<String>>[];
      for (var row in rows) {
        final key = row[0];
        final lines = wrapValue(row[1]!);
        for (int i = 0; i < lines.length; i++) {
          if (i == 0) {
            wrapped.add([key!, lines[i]]);
          } else {
            wrapped.add(['', lines[i]]);
          }
        }
      }
      return wrapped;
    }

    final processedRows = wrapRows();
    final valueWidth = processedRows.fold(0, (w, r) => r[1].length > w ? r[1].length : w);
    String drawRow(List<String> cols, String sep) => '$sep ${cols[0].padRight(fieldWidth)} $sep ${cols[1].padRight(valueWidth)} $sep';
    final top = '╔${'═' * (fieldWidth + 2)}╦${'═' * (valueWidth + 2)}╗';
    final header = drawRow(["Field", "Value - [Bugger Detection]"], '║');
    final divider = '╠${'═' * (fieldWidth + 2)}╬${'═' * (valueWidth + 2)}╣';
    final data = processedRows.map((row) => drawRow(row, '║')).join('\n');
    final bottom = '╚${'═' * (fieldWidth + 2)}╩${'═' * (valueWidth + 2)}╝';
    final table = '''
$warningColor$top
$header
$divider
$data
$bottom$reset
''';
    debugPrint(table);
  }
}
