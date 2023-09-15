
import 'package:flutter/material.dart';

import '../models/cv_model.dart';
import 'cv_edit_page.dart';

class CVPageView extends StatefulWidget {
  @override
  _CVPageViewState createState() => _CVPageViewState();
}

class _CVPageViewState extends State<CVPageView> {
  CV cv = CV(
    fullName: 'Alabi Micheal Segun',
    slackUsername: 'Segun Micheal',
    githubHandle: 'github.com/shegzzy',
    bio: 'I am an innovative and motivated Full-stack Developer who seeks growth'
        ' by consistently learning, unlearning, and relearning. I have over four (4) years'
        ' of experience in Web and Mobile development and have worked on challenging '
        'and engaging projects that required me to work outside my knowledge set.'
        ' Also, convert business/user requirements into maintainable and scalable code.'
        ' My technical expertise includes fluency in Dart (framework: Flutter), react, HTML/CSS, JavaScript, Python,'
        ' and Django knowledge in continuous integration and deployment/delivery using GitLab CI, GitHub actions unit testing '
        'using Flutter, and much more. I have been instrumental in the planning and development process of applications I worked '
        'on either single-handedly or as part of a team. I pay strong attention to details and commitment'
        ' to delivering quality results. I am well-talented and well-positioned to contribute to any project I engage'
        ' with as a proactive team player',
  );

  void updateCV(CV updatedCV) {
    setState(() {
      cv = updatedCV;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditCV(cv, updateCV)),
            );
          },
              icon: const Icon(Icons.edit_note,
              size: 26,
                color: Colors.black54,
              )
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 224, 156, 101),
                Color.fromARGB(255, 65, 36, 114)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/me_pic.png'),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Full Name: ${cv.fullName}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Divider(height: 1,),
                const SizedBox(height: 10),
                Text('Slack Username: ${cv.slackUsername}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Divider(height: 1,),
                const SizedBox(height: 10),
                Text('GitHub Handle: ${cv.githubHandle}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Divider(height: 1,),
                const SizedBox(height: 10),
                Text('Bio: ${cv.bio}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}