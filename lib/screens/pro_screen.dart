
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/subscription_provider.dart';

class ProScreen extends StatelessWidget {
  const ProScreen({super.key});

  static const Color darkPurple = Color(0xFF1E1236);
  static const Color purple = Color(0xFF321A5E);
  static const Color gold = Color(0xFFE6C36B);
  static const Color lightGold = Color(0xFFFFE6A3);

  @override
  Widget build(BuildContext context) {
    final subscription = context.watch<SubscriptionProvider>();

    return Scaffold(
      backgroundColor: darkPurple,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF321A5E),
              Color(0xFF1E1236),
              Color(0xFF170D28),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 15),

                // Premium icon
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [lightGold, Color(0xFFB88632)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: gold.withValues(alpha: 0.3),
                        blurRadius: 25,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.workspace_premium,
                    size: 42,
                    color: Color(0xFF432A13),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'GLOWHABIT PRO',
                  style: TextStyle(
                    color: gold,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Unlock Your Skin’s\nFull Potential',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Your personal skincare journey, upgraded.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD0C4E8),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 28),

                // Subscription card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF65452B),
                        Color(0xFF342039),
                        Color(0xFF21142F),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: gold,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'UPGRADE TO',
                        style: TextStyle(
                          color: lightGold,
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'GlowHabit Pro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'RM6.90',
                              style: TextStyle(
                                color: lightGold,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' / month',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: gold.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '14-DAY FREE TRIAL',
                          style: TextStyle(
                            color: lightGold,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Divider(color: Colors.white24),

                      const SizedBox(height: 15),

                      _buildFeature(
                        Icons.auto_awesome,
                        'Smart Skin Analysis Kit',
                        'Discover your skin type through our assessment.',
                      ),

                      _buildFeature(
                        Icons.spa_outlined,
                        'Custom Ingredients & Avoid List',
                        'Get personalized ingredient recommendations.',
                      ),

                      _buildFeature(
                        Icons.picture_as_pdf_outlined,
                        'Printable PDF Summary',
                        'Export your skin analysis results.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Membership status
                if (subscription.isPro)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF254B37),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.verified,
                          color: Colors.greenAccent,
                          size: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subscription.isTrial
                              ? 'YOUR FREE TRIAL IS ACTIVE!'
                              : 'YOU ARE A GLOWHABIT PRO MEMBER',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Expires: ${subscription.expiryDate!.day}/${subscription.expiryDate!.month}/${subscription.expiryDate!.year}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: subscription.hasUsedTrial
                          ? null
                          : () {
                        final success = context
                            .read<SubscriptionProvider>()
                            .startFreeTrial();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              success
                                  ? 'Congratulations! Your 14-day GlowHabit Pro trial has started!'
                                  : 'Your free trial has already been used.',
                            ),
                            backgroundColor: success
                                ? const Color(0xFF356C49)
                                : Colors.redAccent,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gold,
                        foregroundColor: darkPurple,
                        disabledBackgroundColor: Colors.grey.shade600,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        subscription.hasUsedTrial
                            ? 'FREE TRIAL ALREADY USED'
                            : 'START 14-DAY FREE TRIAL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 15),

                const Text(
                  'Subscription payment integration will be added later.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildFeature(
      IconData icon,
      String title,
      String description,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: gold,
            size: 24,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFFD0C4E8),
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
