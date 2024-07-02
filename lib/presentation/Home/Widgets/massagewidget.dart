import 'package:flutter/material.dart';
//import 'package:markdown_viewer/markdown_viewer.dart';
//import 'package:flutter/widgets.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MassageWidget extends StatelessWidget {
  final String text;
  final String? isformtext;
  const MassageWidget({
    super.key,
    required this.text,
    required this.isformtext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          text == "true" ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 05, horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              constraints: const BoxConstraints(maxWidth: 520),
              decoration: BoxDecoration(
                color: text == 'true' ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
              child: Column(
                crossAxisAlignment: isformtext == "true"
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [MarkdownBlock(data: text)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
