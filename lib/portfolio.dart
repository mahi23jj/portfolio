import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/Education/education.dart';
import 'package:portifolio/appcolor.dart';
import 'package:portifolio/award/awards.dart';
import 'package:portifolio/contact/contact.dart';
import 'package:portifolio/project/project.dart';
import 'package:portifolio/skill/skillsction.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final PageController _pageController = PageController();

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            color: const Color(0xFF0F172A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Logo.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    _navItem("Home", onTap: () => _goToPage(0)),
                    const SizedBox(width: 30),
                    _navItem("About", onTap: () => _goToPage(1)),
                    const SizedBox(width: 30),
                    _navItem("Skills", onTap: () => _goToPage(2)),
                    const SizedBox(width: 30),
                    _navItem("Portfolio", onTap: () => _goToPage(3)),
                    const SizedBox(width: 30),
                    _navItem("Contact", onTap: () => _goToPage(4)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              children: [
                _buildHomeSection(context),
                _buildAboutSection(),
                _buildSkillsSection(),
                _buildProjectsSection(),
                _buildContactSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildHomeSection(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Container(
    height: size.height,
    padding: const EdgeInsets.symmetric(horizontal: 30),
    color: AppColors.background,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// ✨ Text Section with animation
          FadeInLeft(
            duration: const Duration(milliseconds: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.circle, color: AppColors.accent, size: 12),
                    SizedBox(width: 8),
                    Icon(Icons.circle, color: AppColors.surface, size: 12),
                    SizedBox(width: 8),
                    Icon(Icons.circle, color: AppColors.secondaryText, size: 12),
                  ],
                ),
                const SizedBox(height: 20),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                    children: [
                      TextSpan(text: "Hi, I'm "),
                      TextSpan(
                        text: "Mahlet ",
                        style: TextStyle(color: AppColors.accent),
                      ),
                      TextSpan(text: "Solomon"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Backend Developer | Node.js | Flutter Lover",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "I'm a professional Backend Developer. My main goal is to help &\nsatisfy local and global clients by building scalable backend systems.",
                  style: TextStyle(fontSize: 16, color: AppColors.secondaryText),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    _socialButton(Icons.linked_camera),
                    const SizedBox(width: 10),
                    _socialButton(Icons.telegram),
                    const SizedBox(width: 10),
                    _socialButton(Icons.facebook),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text(
                    "Download CV",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🖼️ Image Section with animation
          FadeInRight(
            duration: const Duration(milliseconds: 900),
            child: Container(
              width: size.width * 0.35, // responsive image width
              height: size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(4, 8),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/front.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildAboutSection() => ResumePage();
  Widget _buildSkillsSection() => Center(child: SkillsSection());
  Widget _buildProjectsSection() => Projects();
  Widget _buildContactSection() => ContactSection();

  Widget _navItem(String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

//   Widget _socialButton(IconData icon, Color color) {
//     return CircleAvatar(
//       backgroundColor: Colors.white10,
//       radius: 22,
//       child: Icon(icon, color: color, size: 20),
//     );
//   }
// }

Widget _socialButton(IconData icon) {
  return CircleAvatar(
    backgroundColor: AppColors.surface,
    radius: 22,
    child: Icon(icon, color: AppColors.accent, size: 20),
  );
}
}

