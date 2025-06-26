import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

/// A lightweight logging utility for Flutter that provides
/// rich console output in table format for better debugging.
class Bugger {
  /// ANSI escape code for red bold text (used for warnings/errors)
  static const String warningColor = '\x1B[31;1m';     // 🔴 Red Bold
  static const String successColor = '\x1B[32;1m';     // 🟢 Green Bold
  static const String infoColor    = '\x1B[36;1m';     // 🔵 Cyan Bold
  static const String borderColor  = '\x1B[35;1m';     // 🟣 Magenta Bold

  /// ANSI reset code to restore default text color
  static const String reset = '\x1B[0m';

  /// Maximum width allowed for the value column in console output
  static const int maxValueWidth = 100;

  /// The main log method to print styled debugging information.
  ///
  /// Only runs in debug mode. Captures the file, method, and line
  /// number where `Bugger.log()` is called and formats it in a table.
  static void log(String? title) {
    // Return early if not in debug mode (to avoid logs in production)
    if (!kDebugMode) return;

    /// Get current stack trace (skip 1 frame to get caller)
    final trace = Trace.current(1);

    /// Find the frame that is not from the Bugger class itself
    final frame = trace.frames.firstWhere(
          (f) => !f.uri.toString().contains('bugger'),
      orElse: () => trace.frames.first,
    );

    /// Extracting debug info from the selected frame
    final filePath = frame.uri.toString();
    final fileName = frame.uri.pathSegments.isNotEmpty
        ? frame.uri.pathSegments.last
        : 'unknown';
    final line = frame.line ?? 0;
    final method = frame.member ?? 'unknown';

    /// Key-value pairs to show in the log table
    final rows = [
      ["📍 Issue", title],
      ["📄 File", fileName],
      ["📌 Line", "$line"],
      ["🔧 Method", method],
      ["🔗 Location", "$filePath : At line - $line"],
      ["🌐 GitHub", "https://github.com/rahmanprofile/bugger.git"],
    ];

    /// Get the maximum width of the 'Field' column
    final fieldWidth = rows.fold(
      0,
          (w, r) => r[0]!.length > w ? r[0]!.length : w,
    );

    /// Utility to wrap long text into multiple lines based on max width
    List<String> wrapValue(String value) {
      if (value.length <= maxValueWidth) return [value];
      final lines = <String>[];
      int start = 0;
      while (start < value.length) {
        int end = (start + maxValueWidth < value.length)
            ? start + maxValueWidth
            : value.length;
        lines.add(value.substring(start, end));
        start = end;
      }
      return lines;
    }

    /// Wraps all rows and aligns extra lines with blank keys
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

    /// Get wrapped rows with aligned keys and values
    final processedRows = wrapRows();

    /// Get the maximum width for the value column
    final valueWidth = processedRows.fold(
      0,
          (w, r) => r[1].length > w ? r[1].length : w,
    );

    /// Draw a single table row using padding and a separator
    String drawRow(List<String> cols, String sep) =>
        '$sep ${cols[0].padRight(fieldWidth)} $sep ${cols[1].padRight(valueWidth)} $sep';

    /// Building the top, header, divider, body, and bottom of the table
    final top = '╔${'═' * (fieldWidth + 2)}╦${'═' * (valueWidth + 2)}╗';
    final header = drawRow(["Field", "Value - [Bugger Detection]"], '║');
    final divider = '╠${'═' * (fieldWidth + 2)}╬${'═' * (valueWidth + 2)}╣';
    final data = processedRows.map((row) => drawRow(row, '║')).join('\n');
    final bottom = '╚${'═' * (fieldWidth + 2)}╩${'═' * (valueWidth + 2)}╝';

    /// Combine everything with colors and print to debug console
    final table = '''
$borderColor$top
$borderColor$header
$borderColor$divider
$infoColor$data
$borderColor$bottom$reset
''';

    /// Print to debug console only (debugPrint avoids overflow)
    debugPrint(table);
  }
}
