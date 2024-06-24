import 'package:flutter/material.dart';

class FormFields extends StatefulWidget {
  final String text;
  final IconData icons;
  String valueKeyText;
  String? Function(String?)? validator;

  FormFields({
    required this.text,
    required this.icons,
    required this.valueKeyText,
    required this.validator,
  });

  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.text,
            style: const TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                widget.icons,
                color: const Color.fromARGB(255, 96, 96, 96),
              ),
              const SizedBox(width: 10.0),
              Container(color: Colors.grey, width: 1.0, height: 41.0),
              Expanded(
                child: TextFormField(
                  key: ValueKey(widget.valueKeyText),
                  validator: widget.validator,
                  onSaved: (value) {
                    setState(() {
                      widget.valueKeyText = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

