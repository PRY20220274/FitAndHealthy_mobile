import 'package:fit_healthy/business/form/form_provider.dart';
import 'package:fit_healthy/domain/models/forms/question_read.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key, required this.question, required this.index})
      : super(key: key);

  final QuestionRead question;
  final int index;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  var _alternativeID;
  @override
  Widget build(BuildContext context) {
    final _formProvider = Provider.of<FormProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.index + 1}. ${widget.question.description}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //textAlign: TextAlign.right,
          ),
          ...widget.question.alternatives.map(
            (e) {
              return RadioListTile(
                  title: Text(e.description),
                  value: e.id,
                  groupValue: _alternativeID,
                  activeColor: ComplementPalette.green.shade400,
                  onChanged: (value) {
                    setState(() {
                      _alternativeID = value;
                      _formProvider.setAnswers(
                          widget.index, _alternativeID as int);
                    });
                  });
            },
          )
        ],
      ),
    );
  }
}
