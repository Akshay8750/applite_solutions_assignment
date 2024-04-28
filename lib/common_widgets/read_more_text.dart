import 'package:applite_solutions/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:readmore/readmore.dart';

class ExpandableText extends StatefulWidget {
  final String description;

  const ExpandableText({super.key, required this.description});

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadMoreText(htmlToPlainText(widget.description),
            trimMode: TrimMode.Length,
            trimLength: 350,
            colorClickableText: Theme.of(context).colorScheme.error,
            trimCollapsedText: 'Read more...',
            trimExpandedText: 'Read less...',
            style: AppTextTheme.labelStyle.copyWith(color: Theme.of(context).colorScheme.scrim),
            moreStyle: AppTextTheme.bodyBoldStyle),
      ],
    );
  }

  String htmlToPlainText(String htmlString) {
    var document = html_parser.parse(htmlString);
    String plainText = parseElement(document.body!);
    return plainText;
  }

  String parseElement(dom.Element element) {
    var buffer = StringBuffer();
    for (var node in element.nodes) {
      if (node.nodeType == dom.Node.TEXT_NODE) {
        buffer.write(node.text);
      } else if (node.nodeType == dom.Node.ELEMENT_NODE) {
        var childElement = node as dom.Element;
        if (childElement.localName == "br") {
          buffer.writeln();
        } else {
          buffer.write(parseElement(childElement));
        }
      }
    }
    return buffer.toString();
  }
}
