import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login button clicked'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isDesktop ? 1050 : 500,
                  ),
                  child: isDesktop
                      ? Row(
                          children: [
                            Expanded(
                              child: _buildWelcomeSection(),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: _buildLoginCard(),
                            ),
                          ],
                        )
                      : _buildLoginCard(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------------- WELCOME SECTION ----------------

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF5B5FEF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.school_rounded,
            color: Colors.white,
            size: 38,
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'LearnHub',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Color(0xFF202124),
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          'Learn today.\nBuild your future.',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            height: 1.2,
            color: Color(0xFF5B5FEF),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Access high-quality courses, learn new skills, '
          'and grow your career with LearnHub.',
          style: TextStyle(
            fontSize: 17,
            height: 1.6,
            color: Colors.black54,
          ),
        ),

        const SizedBox(height: 30),

        Row(
          children: [
            _feature(
              Icons.play_circle_outline,
              '100+ Courses',
            ),
            const SizedBox(width: 25),
            _feature(
              Icons.people_outline,
              'Expert Teachers',
            ),
          ],
        ),
      ],
    );
  }

  Widget _feature(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF5B5FEF),
          size: 25,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ---------------- LOGIN CARD ----------------

  Widget _buildLoginCard() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202124),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Login to continue learning',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 30),

          // EMAIL
          const Text(
            'Email Address',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email_outlined),
              filled: true,
              fillColor: const Color(0xFFF7F8FC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF5B5FEF),
                  width: 1.5,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // PASSWORD
          const Text(
            'Password',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: passwordController,
            obscureText: hidePassword,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: Icon(
                  hidePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF7F8FC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF5B5FEF),
                  width: 1.5,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // REMEMBER + FORGOT
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: const Color(0xFF5B5FEF),
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },
              ),

              const Text(
                'Remember me',
                style: TextStyle(fontSize: 13),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Forgot password clicked'),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF5B5FEF),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // LOGIN BUTTON
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B5FEF),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // DIVIDER
          Row(
            children: [
              const Expanded(
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // GOOGLE BUTTON
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Google login clicked'),
                  ),
                );
              },
              icon: const Icon(
                Icons.g_mobiledata,
                size: 30,
              ),
              label: const Text(
                'Continue with Google',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                side: const BorderSide(
                  color: Colors.black12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // SIGN UP
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign up clicked'),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF5B5FEF),
                      fontWeight: FontWeight.bold,
                    ),
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