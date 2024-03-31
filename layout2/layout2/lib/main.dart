import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
               backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Raisha Shafa Dwi Rahma, 20',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Undergraduate Student In Informatics Enginnering',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enthusiastic and highly motivated undergraduate engineering student with'
              'leadership skills, initiative and seeking new challenges. Experienced in'
              'various internal organizations. Capable on working within team and as    '
              'individual. Skilled in basic data mining, network, developing technique '
              'and tools. Interested in learning data analytics.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrganizationalExperience(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 247, 197, 213),
              ),
              child: Text('Organizational Experience',
              style: TextStyle(color: Colors.black,
              ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Interests(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 247, 197, 213),
              ),
              child: Text('Interests',
              style: TextStyle(color: Colors.black,
              ),
              ),
            ),
            SizedBox(height: 80),
            Text(
              'Contact',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.email, color: Colors.black),
                SizedBox(width: 5),
                Text(
                  'raishasdrahma@gmail.com ',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Icon(Icons.phone, color: Colors.black),
                SizedBox(width: 5),
                Text(
                  '+6281387876712',
                  style: TextStyle(
                    fontSize: 14,
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

class OrganizationalExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organizational Experience',
        style: TextStyle(
          color: Color.fromARGB(255, 247, 197, 213),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ExperienceCard(
            organization: 'Pengenalan Kehidupan Kampus Mahasiswa Baru 2023',
            position: 'Facilitator',
            duration: 'Aug 2023 - Oct 2023',
            description:
                'Orientation program that helps incoming students transition smoothly into their university experience.',
          ),
          ExperienceCard(
            organization: 'Teknik Pancasila Bangun Desa Jilid VI',
            position: 'Mentor',
            duration: 'Aug 2023',
            description:
                'Activity to serve the community in a village or area which is driven and supported by SEMA FT-KMUP (Senat Mahasiswa FT-KMUP).',
          ),
          ExperienceCard(
            organization: 'Workshop 2023',
            position: 'Secretary',
            duration: 'Jul 2023 - Aug 2023',
            description:
                'Learning and implementing techniques for creating responsive websites with experts in the field is an invaluable opportunity for individuals of all skill levels.',
          ),
          ExperienceCard(
            organization: 'Kelas Organisasi 2023',
            position: 'Secretary',
            duration: 'Jun 2023 - Aug 2023',
            description:
                'An activity for students to recognize the significance of being part of organizations and to contribute to a better world.',
          ),
          ExperienceCard(
            organization: 'Techno IT 2023',
            position: 'Secretary',
            duration: 'Jan 2023 - Apr 2023',
            description:
                'Annual event held by IMATIKA FT-KMUP at Pancasila University as a medium for new students to channeling and developing innovative ideas related to technology.',
          ),
          ExperienceCard(
            organization: 'IMATIKA FT-KMUP (Ikatan Mahasiswa Teknik Informatika)',
            position: 'Secretary',
            duration: 'Dec 2022 - Nov 2023',
            description:
                'Student Association is an organization that represents and supports students in any field at a university. It aims to enhance the quality of education and academic development for students.',
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String organization;
  final String position;
  final String duration;
  final String description;

  ExperienceCard({
    required this.organization,
    required this.position,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 213, 235, 253),
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              organization,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              position,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              duration,
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Interests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interests',
        style: TextStyle(
          color: const Color.fromARGB(255, 236, 174, 195),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          InterestCard(
            interest: 'Concerts',
            description: 'Love attending live music concerts.',
          ),
          InterestCard(
            interest: 'Zoo',
            description: 'Enjoy visiting zoos and observing different animals.',
          ),
          InterestCard(
            interest: 'Movies',
            description: 'Watching various genres of movies in theaters and at home.',
          ),
          InterestCard(
            interest: 'Kpop',
            description: 'Passionate about Korean pop music and culture (NCT ^_^).',
          ),
          InterestCard(
            interest: 'Beach',
            description: 'Relaxing on the beach and enjoying water activities.',
          ),
          InterestCard(
            interest: 'City Lights',
            description: 'Fascinated by the vibrant lights and energy of city nightlife.',
          ),
        ],
      ),
    );
  }
}

class InterestCard extends StatelessWidget {
  final String interest;
  final String description;

  InterestCard({
    required this.interest,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 213, 235, 253),
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              interest,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}