import 'package:cached_network_image/cached_network_image.dart';
import 'package:discounttour/data/data.dart';
import 'package:discounttour/model/country_model.dart';
import 'package:discounttour/model/popular_tour_models.dart';
import 'package:discounttour/views/details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CountryModel> country = List();
  List<PopularTourModel> popularTours = List();

  @override
  void initState() {
    popularTours = getPopularTours();
    country = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(8),
          child: Image.asset(
            "assets/menu.jpg",
            height: 20,
            width: 20,
          ),
        ),
        elevation: 0.0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.translate(
                offset: Offset(-50, 3),
                child: Image.asset(
                  "assets/logo.jpg",
                  height: 30,
                ),
              ),
              Transform.translate(
                offset: Offset(-45, 0),
                child: Text(
                  " Discount Tour",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Find the Best Tour",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Country",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: country.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CountryListTile(
                        countryName: country[index].countryName,
                        label: country[index].label,
                        numOfTours: country[index].numOfTours,
                        rating: country[index].rating,
                        imgUrl: country[index].imgUrl);
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Popular Tours",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularTours.length,
                itemBuilder: (context, index) {
                  return PopularTours(
                    imgUrl: popularTours[index].imgUrl,
                    title: popularTours[index].title,
                    desc: popularTours[index].desc,
                    price: popularTours[index].price,
                    rating: popularTours[index].rating,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final double rating;

  PopularTours({
    @required this.imgUrl,
    @required this.title,
    @required this.desc,
    @required this.price,
    @required this.rating,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(
            imgUrl: imgUrl,
            placeName: title,
            rating: rating,
          )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff4E6059),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    desc,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xff89A097),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff4E6059),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xff139157),
              ),
              child: Column(
                children: [
                  Text(
                    "$rating",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 2),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryListTile extends StatelessWidget {
  final String label;
  final String countryName;
  final int numOfTours;
  final double rating;
  final String imgUrl;

  CountryListTile({
    @required this.label,
    @required this.countryName,
    @required this.numOfTours,
    @required this.rating,
    @required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 240,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            height: 200,
            width: 150,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white24),
                      child: Text(label ?? label,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              countryName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "$numOfTours",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "$rating",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
