import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              
              // Chicken mascot illustration
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/chicken_mascot.png', // You'll need to add this asset
                  height: 200,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Welcome title
              const Text(
                'Welcome to FreshMeat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 12),
              
              // Subtitle
              const Text(
                'Fresh chicken & meat delivered to your doorstep',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(flex: 3),
              
              // Phone number section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Phone input container
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF3A3A3A),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Country code dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            children: [
                              Text(
                                _selectedCountryCode,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF9E9E9E),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        
                        // Divider
                        Container(
                          height: 24,
                          width: 1,
                          color: const Color(0xFF3A3A3A),
                        ),
                        
                        // Phone number input
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter your phone number',
                              hintStyle: TextStyle(
                                color: Color(0xFF7A7A7A),
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Get OTP button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle OTP request
                    _handleGetOTP();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE53E3E), // Red color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get OTP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Terms and Privacy
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: Color(0xFFE53E3E),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFFE53E3E),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  void _handleGetOTP() {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your phone number'),
          backgroundColor: Color(0xFFE53E3E),
        ),
      );
      return;
    }
    
    // Navigate to OTP verification screen or handle OTP logic
    print('Requesting OTP for: $_selectedCountryCode${_phoneController.text}');
    
    // You can navigate to the next screen here
    // Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}