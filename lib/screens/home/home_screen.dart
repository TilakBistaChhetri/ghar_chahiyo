import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghar_chaiyo/widgets/advice_tools_section.dart';
import 'package:ghar_chaiyo/widgets/newproject_section.dart';
import 'package:ghar_chaiyo/widgets/projectsinlocation.dart';
import 'package:ghar_chaiyo/widgets/top_localities_section.dart';
import '../../theme/theme.dart';
import '../../widgets/property_card.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/search_results_section.dart';
import '../../widgets/magic_homes_section.dart';

class HomeScreen extends StatefulWidget {
  final Function? toggleTheme;

  const HomeScreen({super.key, this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _hideBottomBarAnimController;
  late AnimationController _notificationAnimController;
  bool _isBottomBarVisible = true;
  bool _shouldShowNotification = true;
  bool _isNotificationEnabled = false;
  double _lastScrollPosition = 0;
  // String? _userLocation;

  @override
  void initState() {
    super.initState();
    _hideBottomBarAnimController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _notificationAnimController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _hideBottomBarAnimController.forward();
    _notificationAnimController.forward();

    _scrollController.addListener(_handleScroll);
    _checkNotificationSettings();
  }

  // Check if notifications are enabled
  Future<void> _checkNotificationSettings() async {
    // In a real app, this would check SharedPreferences or another source
    // For demo, we'll just simulate a check after a delay
    await Future.delayed(Duration(milliseconds: 500));

    // In a real implementation, you'd get this from storage:
    // final prefs = await SharedPreferences.getInstance();
    // final isEnabled = prefs.getBool('notifications_enabled') ?? false;

    if (mounted) {
      setState(() {
        _isNotificationEnabled =
            false; // For demo, assuming notifications are disabled
        _shouldShowNotification = !_isNotificationEnabled;
      });
    }
  }

  // Dismiss notification and remember user choice
  void _dismissNotification() {
    _notificationAnimController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _shouldShowNotification = false;
        });
      }
    });

    // In a real app, save this preference:
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setBool('notification_dismissed', true);
    // });
  }

  // Enable notifications
  void _enableNotifications() {
    // In a real app, this would request notification permissions
    // and save the preference
    setState(() {
      _isNotificationEnabled = true;
      _shouldShowNotification = false;
    });
    _dismissNotification();

    // Show a confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notifications enabled'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleScroll() {
    final currentPosition = _scrollController.position.pixels;
    // Handle bottom bar visibility based on scroll direction
    if (currentPosition > _lastScrollPosition && currentPosition > 100) {
      // Scrolling down and not at the top - hide bottom bar
      if (_isBottomBarVisible) {
        _hideBottomBarAnimController.reverse();
        setState(() => _isBottomBarVisible = false);
      }
    } else if (currentPosition < _lastScrollPosition) {
      // Scrolling up - show bottom bar
      if (!_isBottomBarVisible) {
        _hideBottomBarAnimController.forward();
        setState(() => _isBottomBarVisible = true);
      }
    }

    _lastScrollPosition = currentPosition;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hideBottomBarAnimController.dispose();
    _notificationAnimController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;


    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: isDark ? AppColors.darkSurface : Colors.white,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Main content
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                // App Bar with logo
                SliverAppBar(
                  backgroundColor: AppColors.primary,
                  automaticallyImplyLeading: false,
                  title: _buildAppBarContent(),
                  pinned: true,
                  floating: false,
                  elevation: 0,
                  toolbarHeight: 60,
                ),

                // Search section that stays pinned
                SliverPersistentHeader(
                  delegate: _SliverSearchBarDelegate(),
                  pinned: true,
                  floating: false,
                ),

                // Property valuation section that scrolls away
                SliverToBoxAdapter(child: _buildQuickLinksSection()),
              ];
            },
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchResultsSection(),
                  const MagicHomesSection(),
                  const NewProjectsSection(),
                  const TopLocalitiesSection(),
                  const AdviceToolsSection(),
                ],
              ),
            ),
          ),

          // Notification bubble positioned above bottom nav
          if (_shouldShowNotification) _buildNotificationBubble(),

          // Position the bottom navbar at the bottom of the screen
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildAnimatedBottomBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarContent() {
    return Row(
      children: [
        // Custom logo
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/logo.png',
            // width: 30, // Adjust size as needed
            // height: 30, // Adjust size as needed
            fit: BoxFit.contain,
          ),
        ),
        const Spacer(),
        // Chat icon
        IconButton(
          icon: const Icon(
            Icons.chat_bubble_outline,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {},
        ),
        // User icon
        IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.white, size: 24),
          onPressed: () {},
        ),
        // Property posting button
        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Post Property',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinksSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        // Add rounded corners at the bottom
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.radiusXXL),
          bottomRight: Radius.circular(AppDimensions.radiusXXL),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 8 : 12,
        horizontal: isSmallScreen ? 8 : 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildQuickLink(
            Icons.account_balance,
            'Property\nValuation',
            isSmallScreen,
          ),
          _buildQuickLink(Icons.home, 'Home\nLoan', isSmallScreen),
          _buildQuickLink(Icons.chair, 'Home\nInteriors', isSmallScreen),
          _buildQuickLink(Icons.apartment, 'New\nProjects', isSmallScreen),
        ],
      ),
    );
  }

  Widget _buildQuickLink(IconData icon, String label, bool isSmallScreen) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.85),
          radius: isSmallScreen ? 20 : 24, // Smaller on small screens
          child: Icon(
            icon,
            color: AppColors.primary,
            size: isSmallScreen ? 18 : 20,
          ),
        ),
        SizedBox(height: isSmallScreen ? 4 : 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isSmallScreen ? 9 : 11, // Smaller text on small screens
            color: Colors.white,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedBottomBar() {
    return AnimatedBuilder(
      animation: _hideBottomBarAnimController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 56 * (1 - _hideBottomBarAnimController.value)),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.grey.shade600,
              selectedLabelStyle: const TextStyle(fontSize: 12),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'MORE',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationBubble() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return AnimatedBuilder(
      animation: _notificationAnimController,
      builder: (context, child) {
        return Positioned(
          left: 16, // Equal left margin
          right: 16, // Equal right margin
          // Reduced bottom margin to position lower
          bottom: (_isBottomBarVisible ? 56 + 10 : 10),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // Start below screen
              end: Offset.zero, // End in position
            ).animate(_notificationAnimController),
            child: Container(
              width: screenWidth - 32, // Equal margins on both sides
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: Colors.black87,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Want to connect with owners faster?',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 11 : 12,
                        color: Colors.grey.shade800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: _enableNotifications,
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Enable',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 11 : 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(Icons.close, size: 16, color: Colors.grey),
                      onPressed: _dismissNotification,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: const SearchBarWidget(),
    );
  }

  @override
  double get maxExtent => 58;
  @override
  double get minExtent => 58;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
