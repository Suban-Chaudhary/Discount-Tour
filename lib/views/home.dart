import 'package:discounttour/data/data.dart';
import 'package:discounttour/model/country_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CountryModel> country = List();

  @override
  void initState() {
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
      body: Container(
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
                    imgUrl: country[index].imgUrl
                  );
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
            PopularTours(),
          ],
        ),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network("https://www.telegraph.co.uk/content/dam/Travel/Destinations/Asia/Thailand/Phuket/phuket-thailand-beach-boat-lead-main-guide.jpg", height: 200),
        ],
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
            child: Image.network(
              imgUrl,
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
                      child: Text(label ?? "New",
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
                              "Thailand",
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
                            "18 Tours",
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
                          Text("4.3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 2),
                          Icon(Icons.star, size: 20, color: Colors.white),
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
