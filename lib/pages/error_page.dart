part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/error.png',
                      height: 86,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Where are you going?',
                      style: blackTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Seems like the page that you were\nrequested is already gone',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ButtonWidget(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePages()));
                      },
                      color: purpleColor,
                      height: 50,
                      title: 'Back to Home',
                      width:
                          MediaQuery.of(context).size.width - 8 * defaultMargin,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
