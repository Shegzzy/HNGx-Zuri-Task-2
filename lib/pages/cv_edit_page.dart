
import 'package:flutter/material.dart';

import '../models/cv_model.dart';

class EditCV extends StatefulWidget {
  final CV cv;
  final Function(CV) onUpdate;

  EditCV(this.cv, this.onUpdate);

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
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200]?.withOpacity(0.7), // Adjust opacity as needed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color and opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 3), // Offset
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 6,),
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1
                        ),
                      ),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 1,
                      ),
                    )
                  ),

                ),
                SizedBox(height: 20,),
                TextField(
                  controller: slackUsernameController,
                  decoration: InputDecoration(labelText: 'Slack Username',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1
                        ),
                      ),
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                    ),
                  )),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: githubHandleController,
                  decoration: InputDecoration(labelText: 'GitHub Handle',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1
                        ),
                      ),
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                    ),
                  )),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: bioController,
                  maxLines: 20,
                  decoration: InputDecoration(labelText: 'Bio',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.black54,
                          width: 1
                        ),
                      ),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                    ),
                  )),
                ),
                SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final updatedCV = CV(
                        fullName: fullNameController.text,
                        slackUsername: slackUsernameController.text,
                        githubHandle: githubHandleController.text,
                        bio: bioController.text,
                      );
                      widget.onUpdate(updatedCV);
                      Navigator.pop(context);
                    },
                    child: Text('Update'),
                  ),
                ),
              ],
            ),
          ),
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