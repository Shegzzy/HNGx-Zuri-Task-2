
import 'package:flutter/material.dart';

import '../models/cv_model.dart';
import 'cv_edit_page.dart';

class CVPageView extends StatefulWidget {
  @override
  _CVPageViewState createState() => _CVPageViewState();
}

class _CVPageViewState extends State<CVPageView> {
  CV cv = CV(
    fullName: 'John Doe',
    slackUsername: 'john_doe',
    githubHandle: 'johndoe',
    bio: 'Passionate Flutter Developer',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Full Name: ${cv.fullName}'),
            Text('Slack Username: ${cv.slackUsername}'),
            Text('GitHub Handle: ${cv.githubHandle}'),
            Text('Bio: ${cv.bio}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditCV(cv)),
                );
              },
              child: Text('Edit CV'),
            ),
          ],
        ),
      ),
    );
  }
}