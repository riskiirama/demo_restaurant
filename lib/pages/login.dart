part of 'pages.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 140,
            ),
          ],
        ),
      );
    }

    Widget textLogin() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Login ',
              style: textBlack.copyWith(fontSize: 20),
            ),
            Text(
              'Restaurant',
              style: textOrange.copyWith(fontSize: 20),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: textBlack.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 17,
              ),
              decoration: BoxDecoration(
                color: formColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: textBlack,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: textBlack.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 17,
              ),
              decoration: BoxDecoration(
                color: formColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        style: textBlack,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Your Password',
                          hintStyle: textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: handleLogin,
          child: Text(
            'Login',
            style: textWhite.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account? '),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Sign Up',
                style: textOrange.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          textLogin(),
          emailInput(),
          passwordInput(),
          signInButton(),
          footer(),
        ],
      ),
    );
  }
}
