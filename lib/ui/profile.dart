import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controllers.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings_brightness_outlined, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),

              // Profile Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Michael Tuma',
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            )),
                        const SizedBox(height: 4),
                        Text('View profile',
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            )),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              // Stats Cards
              Obx(() => Row(
                children: [
                  _buildStatCard("${controller.trustScore.value}%", "Trustscore"),
                  _buildStatCard("${controller.contributions.value}", "Contributions"),
                  _buildStatCard(controller.membership.value, "Membership", badge: true),
                ],
              )),

              SizedBox(height: screenHeight * 0.04),

              // Menu Options
              _buildMenuItem(Icons.notifications, "Notifications", "Manage how you get notified"),
              _buildMenuItem(Icons.lock, "Security", "Pin setup and biometrics"),
              _buildMenuItem(Icons.support_agent, "Support", "Need help? Contact Us"),
              _buildMenuItem(Icons.info_outline, "About Us", "Terms and Privacy"),

              SizedBox(height: screenHeight * 0.03),

              // Log out
              ListTile(
                leading: const Icon(Icons.power_settings_new, color: Colors.red),
                title: Text('Log out',
                    style: GoogleFonts.manrope(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.red,
                      ),
                    )),
                onTap: () {
                  // TODO: Handle logout
                },
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, {bool badge = false}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: badge ? Colors.greenAccent : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: badge ? Colors.greenAccent : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: GoogleFonts.manrope(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.manrope(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
      onTap: () {},
    );
  }
}
