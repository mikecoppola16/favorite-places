// ignore_for_file: constant_identifier_names

import 'package:uuid/uuid.dart';

const String locationAPIBaseUrl = "https://maps.googleapis.com";
const String MAPS_API_KEY = "AIzaSyDFhe1h8xNeg5ZDV5iwhBjFNwagSb4kh3w";
const String GOOGLE_MAPS_FIELD_ADDRESS = 'formatted_address';
const String GOOGLE_STATIC_MAPS_URI = 'https://maps.googleapis.com/maps/api/staticmap?center=lat,lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7Clat,lng&key=$MAPS_API_KEY';
const double GOOGLE_LATTTUDE = 37.422;
const double GOOGLE_LONGITUDE = -122.084;

const String APPLICATION_JSON = 'application/json';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const String DEFAULT_LANGUAGE = 'language';

const String LOCAL_DB_NAME_PATH = 'db.sqlite';
const int LOCAL_DB_VERSION = 1;

