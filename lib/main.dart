import 'package:flutter/material.dart';

void main() {
  runApp(const GlowHabitApp());
}

class GlowHabitApp extends StatelessWidget {
  const GlowHabitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowHabit',
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B2465),
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ==========================================
// 01. SPLASH SCREEN
// ==========================================
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1236),
              Color(0xFF321A5E),
              Color(0xFF1A0B2E),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Glowing Sparkle Icon Container
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F2668).withOpacity(0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.auto_awesome,
                      size: 64,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'GlowHabit',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Skincare Tracker\n& Analysis Hub',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFD0C4E8),
                    height: 1.4,
                  ),
                ),
                const Spacer(),
                // Get Started Button
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4FA1),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 02. LOGIN / SIGN UP SCREEN
// ==========================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'jamila@example.com');
  final _passwordController = TextEditingController(text: '••••••••');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1236),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'GlowHabit',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text('Email', style: TextStyle(color: Color(0xFFD0C4E8))),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF2D1B4E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Password', style: TextStyle(color: Color(0xFFD0C4E8))),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF2D1B4E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JourneyHubScreen(initialIndex: 0),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B4FA1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign In with Firebase',
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Color(0xFFB1A0D8), fontSize: 13),
                ),
              ),
              const Spacer(),
              const Center(
                child: Text(
                  'Secured by Firebase Authentication',
                  style: TextStyle(color: Color(0xFF7A6899), fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// ALL 9 JOURNEY SCREENS HUB (CSC661 GROUP PROJECT)
// ==========================================
class JourneyHubScreen extends StatefulWidget {
  final int initialIndex;
  const JourneyHubScreen({super.key, this.initialIndex = 0});

  @override
  State<JourneyHubScreen> createState() => _JourneyHubScreenState();
}

class _JourneyHubScreenState extends State<JourneyHubScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    const HomeDashboardScreen(), // 03. Home Dashboard
    const VanityShelfScreen(),   // 04. Vanity Shelf
    const DailyDiaryScreen(),    // 05. Daily Skin Diary
    const SmartQuizScreen(),     // 06. Smart Analysis (Quiz)
    const ProPaywallScreen(),    // 07. GlowHabit Pro (Paywall)
    const DiagnosticResultScreen(), // 08. Diagnostic Result
    const ProfileScreen(),       // 09. Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1236),
        foregroundColor: Colors.white,
        // title: Text('CSC661 Journey: Screen ${_currentIndex + 3} of 9'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Restart Splash',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()),
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex >= _screens.length ? 0 : _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E1236),
        selectedItemColor: const Color(0xFFFFD700),
        unselectedItemColor: const Color(0xFF9A85C4),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shelves), label: 'Shelf'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Diary'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analysis'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Pro'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Result'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ==========================================
// 03. HOME DASHBOARD SCREEN
// ==========================================
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Jamila!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text('Welcome back to your glow.', style: TextStyle(color: Color(0xFFB1A0D8), fontSize: 13)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('FREE TIER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFF170D28))),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF261845),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.withOpacity(0.3)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_amber, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text('EXPIRING SOON - 38 Days Left', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Text('5-Day Glow Streak 🔥', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Routine Checklists AM & PM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          _buildCheckboxItem('Gentle Cleanser', true),
          _buildCheckboxItem('Hydrating Toner', true),
          _buildCheckboxItem('Moisturizer', true),
          _buildCheckboxItem('Sunscreen', false),
        ],
      ),
    );
  }

  Widget _buildCheckboxItem(String title, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF23143E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_box : Icons.check_box_outline_blank,
            color: value ? const Color(0xFFFFD700) : Colors.grey,
          ),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}

// ==========================================
// 04. VANITY SHELF SCREEN
// ==========================================
class VanityShelfScreen extends StatelessWidget {
  const VanityShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('My Vanity (4)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4FA1),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
              children: [
                _buildProductCard('Biore Sunscreen', '38d left', Colors.orange),
                _buildProductCard('Centella Serum', '310d left', Colors.green),
                _buildProductCard('Hada Labo Toner', '141d left', Colors.blue),
                _buildProductCard('5X Ceramide', 'Expired? ⚠️', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String expiry, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF23143E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.spa, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(name, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(expiry, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// ==========================================
// 05. DAILY SKIN DIARY SCREEN
// ==========================================
class DailyDiaryScreen extends StatelessWidget {
  const DailyDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text("How's your skin today?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 20),
          const Text('💧 Hydration (7/10)', style: TextStyle(color: Color(0xFFD0C4E8), fontSize: 15)),
          Slider(value: 0.7, onChanged: (v) {}, activeColor: Colors.blueAccent),
          const SizedBox(height: 10),
          const Text('🔥 Irritation (3/10)', style: TextStyle(color: Color(0xFFD0C4E8), fontSize: 15)),
          Slider(value: 0.3, onChanged: (v) {}, activeColor: Colors.orangeAccent),
          const SizedBox(height: 20),
          const Text('Tag chips', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip('Glowing', true),
              _buildChip('Dry Patches', false),
              _buildChip('T-Zone Oily', true),
              _buildChip('Redness', false),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6B4FA1),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Save Entry to Firestore', style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool selected) {
    return Chip(
      label: Text(label),
      backgroundColor: selected ? const Color(0xFF6B4FA1) : const Color(0xFF23143E),
      labelStyle: TextStyle(color: selected ? Colors.white : const Color(0xFFB1A0D8)),
    );
  }
}

// ==========================================
// 06. SMART ANALYSIS (QUIZ) SCREEN
// ==========================================
class SmartQuizScreen extends StatelessWidget {
  const SmartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Question 1 of 5', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            'How does your face feel 30 minutes after washing?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildOptionCard('A. Tight, flaky or dry (+1 Dry)'),
          _buildOptionCard('B. Shiny and oily all over (+1 Oily)'),
          _buildOptionCard('C. Oily on T-zone only (+1 Combo)'),
          _buildOptionCard('D. Comfortable and balanced (+1 Normal)'),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B4FA1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Next Question →', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF23143E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );
  }
}

// ==========================================
// 07. GLOWHABIT PRO (PAYWALL) SCREEN
// ==========================================
class ProPaywallScreen extends StatelessWidget {
  const ProPaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3F2B1D), Color(0xFF1F150D)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFFFD700), width: 1.5),
            ),
            child: Column(
              children: [
                const Icon(Icons.star, color: Color(0xFFFFD700), size: 48),
                const SizedBox(height: 12),
                const Text(
                  'Upgrade to GlowHabit Pro\n(RM6.90/mo)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
                ),
                const SizedBox(height: 20),
                _buildFeatureRow('✨ Smart Skin Analysis Kit'),
                _buildFeatureRow('📝 Custom Ingredients & Avoid List'),
                _buildFeatureRow('🖨️ Print PDF Summary'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: const Color(0xFF170D28),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Subscribe & Unlock 🔒', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check, color: Color(0xFFFFD700), size: 18),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

// ==========================================
// 08. DIAGNOSTIC RESULT SCREEN
// ==========================================
class DiagnosticResultScreen extends StatelessWidget {
  const DiagnosticResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF23143E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('GlowHabit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFFFD700), borderRadius: BorderRadius.circular(6)),
                      child: const Text('PRO', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF170D28))),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('YOUR SKIN TYPE:', style: TextStyle(color: Color(0xFFB1A0D8), fontSize: 12)),
                const SizedBox(height: 4),
                const Text('Combination (Dehydrated)', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const Divider(color: Color(0xFF3F2B6B), height: 24),
                const Text('Recommended:', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Hyaluronic Acid, Niacinamide', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 16),
                const Text('Avoid:', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Harsh sulfates, drying alcohol', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('Generate & Export PDF Summary'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6B4FA1),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 09. PROFILE PAGE SCREEN
// ==========================================
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _proStatus = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF170D28),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF6B4FA1),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text('NUR JAMILA KHAYRIN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFD700)),
            ),
            child: const Text('GLOWHABIT PRO MEMBER', style: TextStyle(color: Color(0xFFFFD700), fontSize: 11, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          SwitchListTile(
            title: const Text('Pro Status', style: TextStyle(color: Colors.white)),
            value: _proStatus,
            activeColor: const Color(0xFFFFD700),
            onChanged: (val) => setState(() => _proStatus = val),
          ),
          _buildMenuItem(Icons.edit, 'Edit Profile', () {}),
          _buildMenuItem(Icons.history, 'View Diagnostic History', () {}),
          _buildMenuItem(Icons.settings, 'Settings', () {}),
          _buildMenuItem(Icons.logout, 'Log Out', () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SplashScreen()),
            );
          }, isRed: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {bool isRed = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF23143E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isRed ? Colors.redAccent : const Color(0xFFB1A0D8)),
        title: Text(title, style: TextStyle(color: isRed ? Colors.redAccent : Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
