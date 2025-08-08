import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final double progress;
  final String assignedBy;
  final String timeLeft;
  final String imageAsset;
  final int additionalMembers;

  const TaskCard({
    super.key,
    required this.title,
    required this.progress,
    required this.assignedBy,
    required this.timeLeft,
    required this.imageAsset,
    this.additionalMembers = 0,
  });

  @override
  Widget build(BuildContext context) {
    final cappedProgress = progress.clamp(0.0, 1.0);

    return Container(
      // Removed: margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Important: Let the column size itself
        children: [
          // Top Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  height: 140, // Reduced height
                  width: double.infinity,
                  child: Image.asset(imageAsset, fit: BoxFit.cover),
                ),
              ),

              // Time left label
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    timeLeft,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Heart icon
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.black54,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(16), // Reduced padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16, // Reduced font size
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Progress Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Progress',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${(cappedProgress * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Progress Bar
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade200,
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: cappedProgress,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.green.shade500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Bottom Row - Fixed to prevent overflow
                Row(
                  children: [
                    // Avatar Stack - Fixed width
                    SizedBox(
                      height: 24,
                      width: 80, // Fixed width to prevent overflow
                      child: Stack(
                        children: [
                          // First avatar
                          Positioned(
                            left: 0,
                            child: _buildAvatar(Colors.orange.shade400, 'A'),
                          ),
                          // Second avatar
                          Positioned(
                            left: 16,
                            child: _buildAvatar(Colors.blue.shade400, 'B'),
                          ),
                          // Third avatar
                          Positioned(
                            left: 32,
                            child: _buildAvatar(Colors.purple.shade400, 'C'),
                          ),
                          // Additional members count
                          if (additionalMembers > 0)
                            Positioned(
                              left: 48,
                              child: _buildAvatar(
                                Colors.grey.shade600,
                                '+$additionalMembers',
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Assigned by section - Flexible to prevent overflow
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'Assigned by: $assignedBy',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color backgroundColor, String text) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Center(
        child: Text(
          text,
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
