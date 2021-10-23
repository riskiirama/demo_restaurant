part of 'pages.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleRegister() async {
      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
              'Register ',
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

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: textBlack.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: formColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_username.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        style: textBlack,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
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

    Widget registerButton() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: handleRegister,
          child: Text(
            'Register',
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
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account? '),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Sign In',
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
          usernameInput(),
          emailInput(),
          passwordInput(),
          registerButton(),
          footer(),
        ],
      ),
    );
  }
}
