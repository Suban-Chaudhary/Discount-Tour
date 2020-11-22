import 'package:discounttour/model/country_model.dart';

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
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.rating = 4.5;
  countryModel.numOfTours = 10;
  countryModel.imgUrl =
      "https://images.pexels.com/photos/3661973/pexels-photo-3661973.png?auto=compress&cs=tinysrgb&dpr=1&w=500";
  country.add(countryModel);
  countryModel = CountryModel();
  // 3
  countryModel.countryName = "Thailand";
  countryModel.label = "New";
  countryModel.rating = 4.5;
  countryModel.numOfTours = 10;
  countryModel.imgUrl =
      "https://i.pinimg.com/originals/a8/bc/fd/a8bcfd0d128be2563a039dd00cc74ca9.jpg";
  country.add(countryModel);
  countryModel = CountryModel();

  return country;
}
