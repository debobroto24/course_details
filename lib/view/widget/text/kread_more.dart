import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class KReadMore extends StatefulWidget {
  final String text;
  final int maxLength;

  KReadMore({this.maxLength = 100, required this.text});

  @override
  _KReadMoreState createState() => _KReadMoreState();
}

class _KReadMoreState extends State<KReadMore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            text: isExpanded || widget.text.length <= widget.maxLength
                ? widget.text
                : '${widget.text.substring(0, widget.maxLength)}',
            style: subtitle3.copyWith(color: AppColors.textColor),
            children: <TextSpan>[
              if (widget.text.length > widget.maxLength)
                TextSpan(
                  text: isExpanded ? ' Read less' : ' Read more',
                  style: subtitle3.copyWith(color: AppColors.subtitleColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
