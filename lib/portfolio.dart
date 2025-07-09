import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, I’m Mahlet 👋",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Backend Developer | Node.js | Flutter Lover",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purpleAccent,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => scrollTo(600),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text("About Me"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => scrollTo(1200),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text("Projects"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                "🌟 About Me",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "I’m a passionate backend developer focused on building efficient, scalable systems using Node.js and Flutter. I love solving real-world problems and crafting backend solutions that power great user experiences.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 30),
              Text(
                "🛠 Skills",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _skillChip("Node.js"),
                  _skillChip("Express"),
                  _skillChip("MongoDB"),
                  _skillChip("Flutter"),
                  _skillChip("Firebase"),
                  _skillChip("REST APIs"),
                  _skillChip("JWT Auth"),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                "✨ My Projects",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
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
          ),
        ),
      ),
    );
  }

  Widget _projectCard({
    required String title,
    required String description,
    required String techStack,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), Colors.black87],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.4), blurRadius: 10),
        ],
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
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () {
        // Launch URL or handle link
      },
      child: CircleAvatar(
        backgroundColor: Colors.white10,
        radius: 24,
        child: Icon(icon, color: Colors.purpleAccent, size: 20),
      ),
    );
  }

  Widget _skillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.purple.shade700,
      labelStyle: const TextStyle(color: Colors.white),
    );
  }
}
