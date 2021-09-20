part of 'pages.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
            bottom: false,
            child: ListView(
              children: [
                // NOTE : TITLE AND HEADER
                SizedBox(
                  height: defaultMargin,
                ),
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Explore Now",
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Mencari kosan yang cozy",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // NOTE : POPULAR CITIES
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Popular Cities",
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        city: CityModel(
                            id: 1,
                            imageUrl: 'assets/city1.png',
                            name: "Jakarta"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        city: CityModel(
                            isPopular: true,
                            id: 2,
                            imageUrl: 'assets/city2.png',
                            name: "Bandung"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        city: CityModel(
                            id: 3,
                            imageUrl: 'assets/city3.png',
                            name: "Tanggerang"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        city: CityModel(
                            id: 4,
                            imageUrl: 'assets/city4.png',
                            name: "Aceh",
                            isPopular: true),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        city: CityModel(
                            id: 5, imageUrl: 'assets/city5.png', name: "Bogor"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(
                        city: CityModel(
                            id: 1,
                            imageUrl: 'assets/city6.png',
                            name: "Palembang"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // NOTE : RECOMENDED SPACE
                Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    "Recomended Space",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: FutureBuilder(
                      future: spaceProvider.getRecommendedSpaces(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          List<SpaceModel> data = snapshot.data;
                          int index = 0;
                          return Column(
                            children: data.map((e) {
                              index++;
                              return Container(
                                margin:
                                    EdgeInsets.only(top: index == 1 ? 0 : 30),
                                child: SpaceCard(spaceModel: e),
                              );
                            }).toList(),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ],
            )),

        // NOTE: FLOATING ACTIOAN BOTTOM
        floatingActionButton: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
              color: Color(0xFFF6F7F8),
              borderRadius: BorderRadius.circular(23)),

          // NOTE : BOTTOM NAVIGATION BAR
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavbarItem(
                  imageUrl: 'assets/icon_home.png', isActive: true),
              BottomNavbarItem(
                  imageUrl: 'assets/icon_email.png', isActive: false),
              BottomNavbarItem(
                  imageUrl: 'assets/icon_card.png', isActive: false),
              BottomNavbarItem(
                  imageUrl: 'assets/icon_love.png', isActive: false),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
