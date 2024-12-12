import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:flutter/material.dart';

import '../buttons/my_icon_button.dart';
class MyReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextDirection? textDirection;
  const MyReadMoreText({
    super.key,
    required this.text,
    this.style,
    this.textDirection,
  });

  @override
  _MyReadMoreTextState createState() => _MyReadMoreTextState();
}

class _MyReadMoreTextState extends State<MyReadMoreText> {
  bool readMore = false;
  bool isOverflowing = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        setState(() {
          readMore = !readMore;
        });
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the text overflows
          final span = TextSpan(
            text: widget.text,
            style: widget.style ?? MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.normal),
          );
          final tp = TextPainter(
            text: span,
            maxLines: 4,
            textDirection: widget.textDirection ?? TextDirection.rtl,
            textAlign: TextAlign.justify,
          );
          tp.layout(maxWidth: constraints.maxWidth);
          isOverflowing = tp.didExceedMaxLines;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                firstChild: Text(
                  widget.text,
                  style: widget.style??MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.normal),
                  textDirection: widget.textDirection ?? TextDirection.rtl,
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Text(
                  widget.text,
                  textAlign: TextAlign.justify,
                  style: widget.style??MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.normal),
                  textDirection: widget.textDirection ?? TextDirection.rtl,
                ),
                crossFadeState: readMore
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
              // if (isOverflowing)
              //   MyIconButton(
              //   onTap: () {
              //     setState(() {
              //       readMore = !readMore;
              //       print("object");
              //     });
              //   },
              //   icon: readMore?Icons.more_horiz:null,
              // )
            ],
          );
        },
      ),
    );
  }
}