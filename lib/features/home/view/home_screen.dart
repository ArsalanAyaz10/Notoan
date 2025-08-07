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
          height: 60, // Prevent overflow
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

// HomePage widget for the home screen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // TOP BLACK SECTION
          Container(
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hi Jonathan",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Let's work casually",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_on_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Search Bar
                SearchBar(
                  hintText: 'Search your task',
                  leading: const Icon(Icons.search, color: Colors.grey),
                  trailing: [const Icon(Icons.filter_list, color: Colors.grey)],
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
                TaskCard(
                  imageAssetPath: "assets/images/google.png",
                  assignedBy: "Alesso Ery",
                  progress: 0.36,
                  title: "Resign for project cluster landing page",
                  timeLeft: "2 days left",
                ),
              ],
            ),
          ),

          // BOTTOM WHITE SECTION
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    // Add your content here
                    Text(
                      'Your tasks or dashboard content goes here...',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 500),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
