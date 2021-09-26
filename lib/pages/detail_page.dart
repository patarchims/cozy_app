part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final SpaceModel spaceModel;

  const DetailPage({Key? key, required this.spaceModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                // Image.asset(
                //   'assets/thumnail.png',
                //   width: MediaQuery.of(context).size.width,
                //   height: 350,
                //   fit: BoxFit.cover,
                // ),
                CachedNetworkImage(
                  imageUrl: widget.spaceModel.imageUrl ?? '',
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 328,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: whiteColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.spaceModel.name.toString(),
                                      style:
                                          blackTextStyle.copyWith(fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text.rich(TextSpan(
                                        text: '\$${widget.spaceModel.price}',
                                        style: purpleTextStyle.copyWith(
                                            fontSize: 16),
                                        children: [
                                          TextSpan(
                                              text: '/ month',
                                              style: greyTextStyle.copyWith(
                                                  fontSize: 16))
                                        ])),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [1, 2, 3, 4, 5].map((e) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: RatingItem(
                                          index: e,
                                          rating:
                                              widget.spaceModel.rating ?? 0),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // NOTE : MAIN FACILITIES

                          Padding(
                            padding: EdgeInsets.only(left: defaultMargin),
                            child: Text(
                              "Main Facilities",
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilityItem(
                                  imageUrl: 'assets/icon_kitchen.png',
                                  name: 'Kitchen',
                                  total: widget.spaceModel.numberOfKitchens,
                                ),
                                FacilityItem(
                                  imageUrl: 'assets/icon_bedroom.png',
                                  name: 'Bedroom',
                                  total: widget.spaceModel.numberOfBedrooms,
                                ),
                                FacilityItem(
                                  imageUrl: 'assets/icon_cupboard.png',
                                  name: 'Big Lemari',
                                  total: widget.spaceModel.numberofCupboards,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: defaultMargin),
                            child: Text(
                              "Photos",
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          // NOTE: PHOTOS
                          Container(
                            height: 88,
                            child: ListView(
                              scrollDirection: Axis.horizontal,

                              children: widget.spaceModel.photos!.map((e) {
                                return Container(
                                  margin: EdgeInsets.only(left: 24, right: 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: defaultMargin,
                                                    vertical:
                                                        2 * defaultMargin),
                                                padding: EdgeInsets.all(6),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: CachedNetworkImage(
                                                    imageUrl: e,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            2 * defaultMargin,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height -
                                                            4 * defaultMargin,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: e,
                                        width: 110,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: Container(
                                                height: 30,
                                                width: 30,
                                                child:
                                                    CircularProgressIndicator())),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),

                              // children: [
                              //   // SizedBox(
                              //   //   width: defaultMargin,
                              //   // ),
                              //   // Image.asset(
                              //   //   "assets/photo1.png",
                              //   //   width: 110,
                              //   //   height: 88,
                              //   //   fit: BoxFit.cover,
                              //   // ),
                              //   // SizedBox(
                              //   //   width: defaultMargin,
                              //   // ),
                              //   // Image.asset(
                              //   //   "assets/photo2.png",
                              //   //   width: 110,
                              //   //   height: 88,
                              //   //   fit: BoxFit.cover,
                              //   // ),
                              //   // SizedBox(
                              //   //   width: defaultMargin,
                              //   // ),
                              //   // Image.asset(
                              //   //   "assets/photo3.png",
                              //   //   width: 110,
                              //   //   height: 88,
                              //   //   fit: BoxFit.cover,
                              //   // ),
                              // ],
                            ),
                          ),

                          // LOCATION
                          SizedBox(
                            height: 30,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: defaultMargin),
                            child: Text(
                              "Location",
                              style: regularTextStyle.copyWith(fontSize: 16),
                            ),
                          ),

                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                children: [
                                  Text(
                                    widget.spaceModel.address,
                                    style: greyTextStyle.copyWith(fontSize: 14),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      // launchUrl(,
                                      //     'https://www.google.co.id/maps/@2.9896263,99.090288,15z');
                                      launchUrl(
                                          widget.spaceModel.mapUrl.toString());
                                    },
                                    child: Image.asset(
                                      'assets/btn_map.png',
                                      width: 40,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: ButtonWidget(
                              onTap: () {
                                launchUrl('tel:081366204109');
                              },
                              color: purpleColor,
                              height: 50,
                              title: 'Book Now',
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: defaultMargin,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/btn_back.png',
                          width: 40,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Image.asset(
                          isClicked
                              ? 'assets/btn_wishlist_filled.png'
                              : 'assets/btn_wishlist.png',
                          width: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
