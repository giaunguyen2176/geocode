import '../utils/try_parse.dart';

class Address {
  /// The elevation in meters.
  double elevation;

  /// The timezone.
  String timezone;

  /// geocode is an alphanumeric string representing both latitude and longitude
  /// as one value. Nearby points will have similar geocodes.
  int geoNumber;

  /// The properly formated street address number to be returned.
  int streetNumber;

  /// The properly formated street address to be returned.
  String streetAddress;

  /// The properly formated city name to be returned.
  String city;

  /// The properly formated country code to be returned.
  String countryCode;

  /// The properly formated country name to be returned.
  String countryName;

  /// The properly formated region to be returned.
  String region;

  /// The properly formated postal code to be returned.
  String postal;

  /// The distance of the result location from the input location.
  double distance;

  /// The properly formated district name to be returned.
  String district;

  /// The properly formated ward name to be returned.
  String ward;

  Address(
      {this.elevation,
      this.timezone,
      this.geoNumber,
      this.streetNumber,
      this.streetAddress,
      this.city,
      this.countryCode,
      this.countryName,
      this.region,
      this.postal,
      this.distance,
      this.district,
      this.ward});

  factory Address.fromJson(Map<String, dynamic> address) => Address(
      elevation: double.tryParse(tryParse(address['elevation'])),
      timezone: tryParse(address['timezone']),
      geoNumber: tryParse(address['geonumber']) == null ? null : int.tryParse(tryParse(address['geonumber'])),
      streetNumber: tryParse(address['stnumber']) == null ? null : int.tryParse(tryParse(address['stnumber'])),
      streetAddress: tryParse(address['staddress']),
      city: tryParse(address['city']),
      countryCode: tryParse(address['prov']),
      countryName: tryParse(address['country']),
      region: tryParse(address['region']),
      postal: tryParse(address['postal']),
      distance: double.tryParse(tryParse(address['distance'])),
      district: tryParse(address['adminareas']['admin6']['name']),
      ward: tryParse(address['adminareas']['admin8']['name'])
  );

  @override
  String toString() =>
      "GEOCODE: elevation=$elevation, timezone=$timezone, geoNumber=$geoNumber," +
      "streetNumber=$streetNumber, streetAddress=$streetAddress, city=$city, " +
      "countryCode=$countryCode, countryName=$countryName, region=$region, " +
      "postal=$postal, distance=$distance, district=$district, ward=$ward";
}
