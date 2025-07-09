import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SkillsSection extends StatelessWidget {
  final Color bgColor = const Color(0xFF0F172A);
  final Color chipColor = const Color(0xFF1E293B);
  final Color textColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _section("Backend Development", [
            _category("Languages & Runtimes", ["Node.js", "TypeScript", "Python", "Java", "Go"]),
            _category("Frameworks", ["Express.js", "Spring Boot", "NestJS", "Next.js"]),
            _category("Database & ORM", ["MongoDB", "PostgreSQL", "SQLite", "Mongoose", "Prisma"]),
            _category("APIs & Communication", ["REST", "GraphQL", "WebSocket", "gRPC"]),
          ]),
          const SizedBox(width: 100),
          _section("Mobile Development", [
            _category("Frameworks & Tools", ["Flutter", "Android Studio", "VS Code"]),
            _category("State Management", ["Provider", "Bloc", "Riverpod"]),
          ]),
          const SizedBox(width: 100),
          _section("DevOps & Infrastructure (* learning !! )", [
            _category("Containers & Orchestration", ["Docker", "Kubernetes"]),
            _category("IaC & Config", ["Terraform", "Helm"]),
            _category("CI/CD", ["GitHub Actions", "Jenkins", "ArgoCD"]),
            _category("Cloud", ["AWS", "Linux", "Bash"]),
          ]),
        ],
      ),
    );
  }

  Widget _section(String title, List<Widget> categories) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          ...categories,
        ],
      ),
    );
  }

  Widget _category(String title, List<String> skills) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((s) => _hoverChip(s)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _hoverChip(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          tween: Tween<double>(begin: 1, end: 1),
          builder: (context, scale, child) => AnimatedScale(
            duration: const Duration(milliseconds: 150),
            scale: scale,
            child: child,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: chipColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
