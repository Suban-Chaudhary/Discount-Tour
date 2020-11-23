import 'package:discounttour/model/country_model.dart';
import 'package:discounttour/model/popular_tour_models.dart';

List<CountryModel> getCountries() {
  List<CountryModel> country = List();
  CountryModel countryModel = CountryModel();

  // 0
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.rating = 4.5;
  countryModel.numOfTours = 10;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  country.add(countryModel);
  countryModel = CountryModel();

  // 1
  countryModel.countryName = "Malaysia";
  countryModel.label = "Sale";
  countryModel.rating = 4.3;
  countryModel.numOfTours = 18;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  country.add(countryModel);
  countryModel = CountryModel();

  // 2
  countryModel.countryName = "Bhutan";
  countryModel.label = "Standard";
  countryModel.rating = 4.5;
  countryModel.numOfTours = 12;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/3661973/pexels-photo-3661973.png?auto=compress&cs=tinysrgb&dpr=1&w=500";
  country.add(countryModel);
  countryModel = CountryModel();

  // 3
  countryModel.countryName = "Italy";
  countryModel.label = "Popular";
  countryModel.rating = 4.9;
  countryModel.numOfTours = 17;
  countryModel.imgUrl =
      "https://i.pinimg.com/originals/a8/bc/fd/a8bcfd0d128be2563a039dd00cc74ca9.jpg";
  country.add(countryModel);
  countryModel = CountryModel();

  // 4
  countryModel.countryName = "France";
  countryModel.label = "Most Visited";
  countryModel.rating = 4.1;
  countryModel.numOfTours = 13;
  countryModel.imgUrl =
      "https://www.eturbonews.com/wp-content/uploads/2020/05/0a1-99.jpg";
  country.add(countryModel);
  countryModel = CountryModel();

  return country;
}


List<PopularTourModel> getPopularTours(){
  List<PopularTourModel> popularTours = List();
  PopularTourModel popularTourModel = PopularTourModel();

  // 0
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTours.add(popularTourModel);
  popularTourModel = new PopularTourModel();

// 1
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Cuba";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 499.99";
  popularTourModel.rating = 4.5;
  popularTours.add(popularTourModel);
  popularTourModel = new PopularTourModel();

// 2
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/1477430/pexels-photo-1477430.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Dominican";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.2;
  popularTours.add(popularTourModel);
  popularTourModel = new PopularTourModel();

// 3
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/1743165/pexels-photo-1743165.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "European";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTours.add(popularTourModel);
  popularTourModel = new PopularTourModel();

// 4
  popularTourModel.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTourModel.title = "Thailand";
  popularTourModel.desc = "10 nights for two/all inclusive";
  popularTourModel.price = "\$ 245.50";
  popularTourModel.rating = 4.0;
  popularTours.add(popularTourModel);
  popularTourModel = new PopularTourModel();

  return popularTours;
}