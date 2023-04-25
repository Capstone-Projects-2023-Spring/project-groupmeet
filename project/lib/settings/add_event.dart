import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key, required this.title, required this.ref})
      : super(key: key);

  final String title;
  final DatabaseReference ref;

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late DateTime start = DateTime.now();
  late DateTime end = DateTime.now();
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();

    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlatformText("Start Time"),
                DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  initialValue: DateTime.now().toString(),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    start = DateTime.parse(val as String);
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlatformText("End Time"),
                DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  initialValue: DateTime.now().toString(),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  onChanged: (val) => end = DateTime.parse(val as String),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    print(val);
                    end = DateTime.parse(val as String);
                  },
                ),
              ],
            ),
            Column(
              children: [
                PlatformTextButton(
                  onPressed: () async {
                    print("start");
                    List<List<String?>> events = [];
                    //create array of events that already existed.
                    final memberSnapshot =
                        await ref.child("calendarEvents").get();
                    for (var event in memberSnapshot.value as List) {
                      print(event);
                      events.add([event[0], event[1], event[2], event[3]]);
                    }

                    List<String?> temp = [
                      "null",
                      start.toString(),
                      "null",
                      end.toString()
                    ];
                    events.add(temp);

                    ref.update({
                      "calendarEvents": events,
                    });
                    print("added");
                  },
                  color: Colors.white,
                  child: PlatformText(
                    "Submit",
                    selectionColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
