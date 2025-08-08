import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/task_card.dart';
import 'package:notoan/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          // Add your action here
        },
        backgroundColor: AppColors.primaryGreen,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        surfaceTintColor: Colors.grey,
        elevation: 5,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(icon: Icons.home, index: 0, label: "Home"),
              buildNavItem(
                icon: Icons.today_outlined,
                index: 1,
                label: "Your Task",
              ),
              SizedBox(width: 40), // Space for FAB
              buildNavItem(
                icon: Icons.calendar_month,
                index: 2,
                label: "Calendar",
              ),
              buildNavItem(icon: Icons.settings, index: 3, label: "Workspace"),
            ],
          ),
        ),
      ),
      body: HomePage(),
    );
  }

  Widget buildNavItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryGreen : AppColors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.primaryGreen : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample data for task cards
  final List<Map<String, dynamic>> taskCards = [
    {
      'imageAsset': 'assets/images/todo.png',
      'assignedBy': 'Alesso Ery',
      'progress': 0.36,
      'title': 'Resign for project cluster landing page',
      'timeLeft': '2 days left',
      'additionalMembers': 3,
    },
    {
      'imageAsset': 'assets/images/dashboard.png',
      'assignedBy': 'Sarah Johnson',
      'progress': 0.75,
      'title': 'Dashboard component redesign',
      'timeLeft': '5 days left',
      'additionalMembers': 2,
    },
    {
      'imageAsset': 'assets/images/mobile_app.png',
      'assignedBy': 'Mike Chen',
      'progress': 0.20,
      'title': 'Mobile app UI improvements',
      'timeLeft': '1 week left',
      'additionalMembers': 4,
    },
    {
      'imageAsset': 'assets/images/website.png',
      'assignedBy': 'Emma Wilson',
      'progress': 0.90,
      'title': 'Website performance optimization',
      'timeLeft': '3 days left',
      'additionalMembers': 1,
    },
  ];

  // Sample data for today's tasks
  final List<Map<String, dynamic>> todayTasks = [
    {'priority': 'High', 'title': 'Fix lag on Carousel', 'avatars': 3},
    {'priority': 'Medium', 'title': 'Review design mockups', 'avatars': 2},
    {'priority': 'Low', 'title': 'Update documentation', 'avatars': 1},
    {'priority': 'High', 'title': 'Prepare Q3 presentation', 'avatars': 4},
  ];

  @override
  Widget build(BuildContext context) {
    // Define the overlap amount for the cards
    final double cardOverlapAmount = 100;
    final double blackSectionHeight = 320;

    return SafeArea(
      child: SingleChildScrollView(
        // Enables overall vertical scrolling
        child: Column(
          children: [
            // TOP BLACK SECTION (Header, Search, "Your Latest Projects" title)
            Container(
              width: double.infinity,
              height: blackSectionHeight,
              color: Colors.black,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hi, Jonathan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Let's work casually",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_on_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search Bar (REPLACED)
                  SearchBar(
                    hintText: 'Search your task',
                    leading: const Icon(Icons.search, color: Colors.grey),
                    trailing: [
                      const Icon(Icons.filter_list, color: Colors.grey),
                    ],
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.transparent,
                    ),
                    surfaceTintColor: const MaterialStatePropertyAll<Color>(
                      Colors.transparent,
                    ),
                    overlayColor: const MaterialStatePropertyAll<Color>(
                      Colors.transparent,
                    ),
                    shadowColor: const MaterialStatePropertyAll<Color>(
                      Colors.transparent,
                    ),
                    elevation: const MaterialStatePropertyAll<double>(0),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Section Title
                  Row(
                    children: [
                      Text(
                        "Your Latest Projects",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // This SizedBox creates space for the cards to overlap into the black section
                  SizedBox(height: cardOverlapAmount),
                ],
              ),
            ),

            // Horizontal Task Cards section (positioned to overlap)
            Transform.translate(
              offset: Offset(0, -cardOverlapAmount),
              child: Container(
                height:
                    290, // Adjusted height for TaskCard to prevent bottom overflow
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ), // Padding for the list itself
                  itemCount: taskCards.length,
                  itemBuilder: (context, index) {
                    final task = taskCards[index];
                    return Container(
                      width:
                          250, // Adjusted width for each card to prevent right overflow
                      margin: const EdgeInsets.only(
                        right: 16,
                      ), // Spacing between cards
                      child: TaskCard(
                        imageAsset: task['imageAsset'],
                        assignedBy: task['assignedBy'],
                        progress: task['progress'],
                        title: task['title'],
                        timeLeft: task['timeLeft'],
                        additionalMembers: task['additionalMembers'] ?? 0,
                      ),
                    );
                  },
                ),
              ),
            ),

            // BOTTOM WHITE SECTION CONTENT
            Transform.translate(
              offset: Offset(0, -cardOverlapAmount),
              child: Container(
                width: double.infinity,
                color: Colors.white, // This will be the white background
                padding: const EdgeInsets.only(
                  top: 20, // Padding from the top of this white section
                  left: 20,
                  right: 20,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Today's Tasks Header
                    Row(
                      children: [
                        Text(
                          'Today task',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Today's task items
                    ...todayTasks
                        .map(
                          (task) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  // Priority Tag
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          task['priority'] == 'High'
                                              ? Colors.red.shade100
                                              : Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      task['priority'],
                                      style: TextStyle(
                                        color:
                                            task['priority'] == 'High'
                                                ? Colors.red.shade700
                                                : Colors.blue.shade700,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      task['title'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Avatar stack for today's tasks
                                  SizedBox(
                                    width: (task['avatars'] * 16.0) + 10,
                                    height: 24,
                                    child: Stack(
                                      children: List.generate(task['avatars'], (
                                        index,
                                      ) {
                                        return Positioned(
                                          left: index * 16.0,
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: _getAvatarColor(
                                              index,
                                            ),
                                            backgroundImage: AssetImage(
                                              'assets/images/avatar${index + 1}.png',
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  if (task['avatars'] > 3)
                                    Positioned(
                                      left: 3 * 16.0,
                                      child: _buildPlusAvatar(
                                        task['avatars'] - 3,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),

                    // Bottom spacing for FAB
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Today's Task avatars
  Color _getAvatarColor(int index) {
    final colors = [
      Colors.blue.shade400,
      Colors.purple.shade400,
      Colors.green.shade400,
      Colors.orange.shade400,
    ];
    return colors[index % colors.length];
  }

  Widget _buildPlusAvatar(int count) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Center(
        child: Text(
          '+$count',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
