
import 'package:flutter/material.dart';

import '../models/cv_model.dart';

class EditCV extends StatefulWidget {
  final CV cv;

  EditCV(this.cv);

  @override
  _EditCVState createState() => _EditCVState();
}

class _EditCVState extends State<EditCV> {
  late TextEditingController fullNameController;
  late TextEditingController slackUsernameController;
  late TextEditingController githubHandleController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.cv.fullName);
    slackUsernameController = TextEditingController(text: widget.cv.slackUsername);
    githubHandleController = TextEditingController(text: widget.cv.githubHandle);
    bioController = TextEditingController(text: widget.cv.bio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit CV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: slackUsernameController,
              decoration: InputDecoration(labelText: 'Slack Username'),
            ),
            TextField(
              controller: githubHandleController,
              decoration: InputDecoration(labelText: 'GitHub Handle'),
            ),
            TextField(
              controller: bioController,
              decoration: InputDecoration(labelText: 'Bio'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.cv.fullName = fullNameController.text;
                  widget.cv.slackUsername = slackUsernameController.text;
                  widget.cv.githubHandle = githubHandleController.text;
                  widget.cv.bio = bioController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    slackUsernameController.dispose();
    githubHandleController.dispose();
    bioController.dispose();
    super.dispose();
  }
}