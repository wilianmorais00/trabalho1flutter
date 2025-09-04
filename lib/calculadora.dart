import 'package:flutter/material.dart';
import 'components/menu.dart';

class Calculadora extends StatelessWidget {
  Calculadora({super.key});

  final ValueNotifier<String> display = ValueNotifier<String>('0');
  double? a;
  String? op;
  bool clearNext = false;

  void press(String k) {
    var d = display.value;

    if ('0123456789.'.contains(k)) {
      if (clearNext || d == '0') {
        d = k == '.' ? '0.' : k;
        clearNext = false;
      } else {
        if (k == '.' && d.contains('.')) return;
        d += k;
      }
      display.value = d;
      return;
    }
    if (k == 'C') {
      display.value = '0';
      a = null;
      op = null;
      clearNext = false;
      return;
    }
    if ('+-×÷'.contains(k)) {
      a = double.tryParse(d) ?? 0;
      op = k;
      clearNext = true;
      return;
    }
    if (k == '=') {
      if (a == null || op == null) return;
      final b = double.tryParse(d) ?? 0;
      double r;
      switch (op) {
        case '+':
          r = a! + b;
          break;
        case '-':
          r = a! - b;
          break;
        case '×':
          r = a! * b;
          break;
        case '÷':
          if (b == 0) {
            display.value = '0';
            a = null;
            op = null;
            clearNext = false;
            return;
          }
          r = a! / b;
          break;
        default:
          return;
      }
      display.value =
          r == r.roundToDouble() ? r.toStringAsFixed(0) : r.toString();
      a = r;
      op = null;
      clearNext = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final keys = [
      'C',
      '÷',
      '×',
      '-',
      '7',
      '8',
      '9',
      '+',
      '4',
      '5',
      '6',
      '=',
      '1',
      '2',
      '3',
      '.',
      '0',
      '',
      '',
      '',
    ];

    final mq = MediaQuery.of(context);
    final shortest = mq.size.shortestSide;
    final displayFont = shortest.clamp(320, 800) / 6.5;
    final keyFont = shortest.clamp(320, 800) / 14;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora",
            style: TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: const Color.fromARGB(255, 141, 204, 255),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                  horizontal: shortest * 0.06, vertical: shortest * 0.04),
              height: shortest * 0.28,
              child: ValueListenableBuilder<String>(
                valueListenable: display,
                builder: (context, value, _) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: displayFont, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    shortest * 0.03, 0, shortest * 0.03, shortest * 0.03),
                child: LayoutBuilder(
                  builder: (context, c) {
                    const cols = 4;
                    final rows = (keys.length / cols).ceil();
                    final spacing = shortest * 0.02;
                    final cellW = (c.maxWidth - spacing * (cols - 1)) / cols;
                    final cellH = (c.maxHeight - spacing * (rows - 1)) / rows;
                    final aspect = cellW / cellH;

                    return GridView.count(
                      crossAxisCount: cols,
                      mainAxisSpacing: spacing,
                      crossAxisSpacing: spacing,
                      childAspectRatio: aspect,
                      children: keys.map((k) {
                        if (k.isEmpty) return const SizedBox.shrink();
                        final isEquals = k == '=';
                        return ElevatedButton(
                          onPressed: () => press(k),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: isEquals ? Colors.blue : null,
                            foregroundColor: isEquals ? Colors.white : null,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(shortest * 0.02),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(k,
                                style: TextStyle(
                                    fontSize: keyFont,
                                    fontWeight: FontWeight.w600)),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(child: Menu()),
    );
  }
}
