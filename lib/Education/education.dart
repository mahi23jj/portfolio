import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  final Color bgColor = const Color(0xFF0F172A);
  final Color chipColor = const Color(0xFF1E293B);
  final Color textColor = Colors.white70;
  final List<Map<String, String>> education = [
    {
      'date': 'November 14, 2023',
      'title': 'UI Design Training',
      'subtitle': 'Alura',
    },
    {
      'date': 'April 7, 2023',
      'title': 'Web Accessibility Training',
      'subtitle': 'Alura',
    },
    {
      'date': 'March 9, 2022',
      'title': 'Front-end Training',
      'subtitle': 'Alura',
    },
    {
      'date': '2019 - 2021',
      'title': 'Computer Science Degree',
      'subtitle': 'Wyden UniFBV',
    },
  ];

  final List<Map<String, String>> experience = [
    {
      'date': 'March 2023 - April 2023',
      'title': 'Software Developer',
      'subtitle': 'O-PitBlast',
    },
    {
      'date': 'September 2021 - November 2021',
      'title': 'Web Developer',
      'subtitle': 'Lab UniFBV',
    },
    {
      'date': 'April 2024',
      'title': 'Freelancer',
      'subtitle': 'Focus Digital Marketing',
    },
    {'date': 'May 2024', 'title': 'Freelancer', 'subtitle': 'Afago'},
  ];

  Widget buildCard(String date, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 600,
     
      decoration: BoxDecoration(color: Color.fromRGBO(31, 30, 64, 1)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(color: Colors.blueAccent, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(subtitle, style: TextStyle(color: Colors.grey[400])),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Map<String, String>> data) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...data.map(
            (item) =>
                buildCard(item['date']!, item['title']!, item['subtitle']!),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Tablet / Desktop layout
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: Container(
                  color: bgColor,
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                    children: [
                      buildSection("Education", education),
                      // SizedBox(width: 4),
                      buildSection("Professional Experience", experience),
                    ],
                  ),
                ),
              );
            } else {
              // Mobile layout
              return Container(
                color: bgColor,
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSection("Education", education),
                    SizedBox(height: 32),
                    buildSection("Professional Experience", experience),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
