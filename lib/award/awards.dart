import 'package:flutter/material.dart';

class AwardsSection extends StatelessWidget {
  final List<Award> awards = [
    Award(
      title: "A2SV Top Contributor",
      description: "Recognized for exceptional teamwork and code quality.",
      imagePath: "assets/images/a2sv_award.png",
      link: 'hdjs'
    ),
    Award(
      title: "Hackathon Winner",
      description: "1st place in national hackathon solving community issues.",
      imagePath: "assets/images/hackathon.png",
      link: 'hdjs'
    ),
    Award(
      title: "Google Women Techmakers",
      description: "Awarded for leadership in tech and advocacy for inclusion.",
      imagePath: "assets/images/a.jpg",
      link: 'hdjs'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: awards.map((award) => _awardCard(award)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _awardCard(Award award) {
    return GestureDetector(
      onTap: () {
        // launchUrl(Uri.parse(award.link));
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                award.imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              award.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              award.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Award {
  final String title;
  final String description;
  final String imagePath;
  final String link;

  Award({
    required this.link,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
