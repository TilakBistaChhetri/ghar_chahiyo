import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../services/projects_service.dart';

class MagicHomesSection extends StatefulWidget {
  const MagicHomesSection({super.key});

  @override
  State<MagicHomesSection> createState() => _MagicHomesSectionState();
}

class _MagicHomesSectionState extends State<MagicHomesSection> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _newProjects = [];

  @override
  void initState() {
    super.initState();
    _fetchProjectsData();
  }

  Future<void> _fetchProjectsData() async {
    setState(() => _isLoading = true);

    try {
      // Fetch from API
      final data = await ProjectsService.getNewProjects();

      if (mounted) {
        setState(() {
          _newProjects = List<Map<String, dynamic>>.from(data['projects']);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      debugPrint('Error fetching projects data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Light blue background section
        Container(
          color: const Color(0xFFF0F8FF),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // "New Launch" tag
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                  ),
                  child: const Text(
                    'New Launch',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // MagicHomes heading
              Center(
                // Add Center widget here
                child: const Text(
                  'जादुको घर',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFFAA2222),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Encyclopedia heading
              const Text(
                'Encyclopedia For All New Projects',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 20),

              // Three feature icons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureItem(
                    'assets/icons/folder.png',
                    'Directory For All\nNew Projects',
                    Icons.folder,
                    Colors.teal,
                  ),
                  _buildFeatureItem(
                    'assets/icons/document.png',
                    'Latest RERA\nReports',
                    Icons.article,
                    Colors.red,
                  ),
                  _buildFeatureItem(
                    'assets/icons/chat.png',
                    'Expert Reviews\n& Advice',
                    Icons.chat_bubble,
                    Colors.orange,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // View All Projects button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'View All Projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Property type question card
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What type of Property are you looking for?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  'Share details for a personalized experience.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Share Requirements',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(
    String imageAsset,
    String title,
    IconData fallbackIcon,
    Color iconBgColor,
  ) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconBgColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(fallbackIcon, size: 20, color: iconBgColor),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
