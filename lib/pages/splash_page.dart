part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/splash_image.png')),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Find Cozy House\nto Stay and Happy",
                      style: blackTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                      style: greyTextStyle,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(
                        color: purpleColor,
                        height: 50,
                        width: 210,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePages()));
                        },
                        title: 'Explore Now'),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
