import 'package:flutter/material.dart';
import 'package:telemed_doc/bloc/scan_bloc/scan_bloc.dart';
import 'package:telemed_doc/util/constant.dart';

class ScannedDocumentName extends StatelessWidget {
  final ScanBloc scanBloc;

  const ScannedDocumentName({Key key, this.scanBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: scanBloc.reportName,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Card(
              color: ALICE_BLUE,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextFormField(
                  autocorrect: false,
                  autofocus: true,
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    scanBloc.reportNameChanged(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: ALICE_BLUE,
                    hintText: 'Name of Report',
                  ),
                ),
              ),
            ),
          );
        });
  }
}
