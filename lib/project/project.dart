import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _projectCard(
          title: "Japi App",
          description:
              "A GPA & CGPA tracking mobile app with leaderboard and notifications.",
          techStack: "Flutter, Node.js, Express, MongoDB",
          color: Colors.deepPurpleAccent,
        ),
        const SizedBox(height: 20),
        _projectCard(
          title: "Charity App",
          description:
              "Donation-based app with event filtering, file uploads, and admin flow.",
          techStack: "Flutter, Node.js, Express, Multer",
          color: Colors.purple,
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

// Project Card
Widget _projectCard({
  required String title,
  required String description,
  required String techStack,
  required Color color,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 400,
        height:300,
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage("assets/images/a.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(width: 50,),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Text(
              "🚀 Tech Used: $techStack",
              style: const TextStyle(fontSize: 14, color: Colors.white60),
            ),
          ],
        ),
      ),
    ],
  );
}
