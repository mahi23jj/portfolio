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
             Container(
  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  color: const Color(0xFF0F172A), // dark navy blue
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Logo (you can replace with Image.asset or an SVG)
      const Text(
        "Logo.",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),

      // Navigation Menu
      Row(
        children: [
          _navItem("Home", isActive: true, onTap: () => scrollTo(0)),
          const SizedBox(width: 30),
          _navItem("About", onTap: () => scrollTo(600)),
          const SizedBox(width: 30),
          _navItem("Skills", onTap: () => scrollTo(900)),
          const SizedBox(width: 30),
          _navItem("Portfolio", onTap: () => scrollTo(1200)),
          const SizedBox(width: 30),
          _navItem("Contact", onTap: () => scrollTo(1500)),
        ],
      ),
    ],
  ),
),

              Container(
  height: 600,
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 30),
  // decoration: const BoxDecoration(
  //   gradient: LinearGradient(
  //     colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //   ),
  // ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.circle, color: Colors.pinkAccent, size: 12),
          const SizedBox(width: 8),
          Icon(Icons.circle, color: Colors.blueAccent, size: 12),
          const SizedBox(width: 8),
          Icon(Icons.circle, color: Colors.purpleAccent, size: 12),
        ],
      ),
      const SizedBox(height: 20),
      RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: "Hi, I'm ", style: TextStyle(color: Colors.white)),
            TextSpan(
                text: "Mahlet ",
                style: TextStyle(color: Colors.pinkAccent)),
            TextSpan(
                text: "Solomon",
                style: TextStyle(color: Colors.blueAccent)),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        "Backend Developer | Node.js | Flutter Lover",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white70,
        ),
      ),
      const SizedBox(height: 25),
      const Text(
        "I'm a professional Backend Developer. My main goal is to help &\nsatisfy local and global clients by building scalable backend systems.",
        style: TextStyle(fontSize: 16, color: Colors.white54),
      ),
      const SizedBox(height: 30),
      Row(
        children: [
          _socialButton(Icons.linked_camera, Colors.purple),
          const SizedBox(width: 10),
          _socialButton(Icons.telegram, Colors.lightBlue),
          const SizedBox(width: 10),
          _socialButton(Icons.facebook, Colors.indigo),
        ],
      ),
      const SizedBox(height: 30),
      SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            // download CV or open URL
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30),
          ),
          child: const Text(
            "Download CV",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  ),
),

              // Container(
              //   // to cover whole page of a front page
              //   height: 600,
               
              //   child: Column(
              //     children: [
              //       Text(
              //         "Hi, I’m Mahlet Solomon 👋",
              //         style: TextStyle(
              //           fontSize: 32,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              // Text(
              //   "Backend Developer | Node.js | Flutter Lover",
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.purpleAccent,
              //   ),
              // ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              const SizedBox(height: 40),
             
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
Widget _socialButton(IconData icon, Color color) {
  return CircleAvatar(
    backgroundColor: Colors.white10,
    radius: 22,
    child: Icon(icon, color: color, size: 20),
  );
}

Widget _navItem(String title, {bool isActive = false, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      title,
      style: TextStyle(
        color: isActive ? Colors.pinkAccent : Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  );
}
