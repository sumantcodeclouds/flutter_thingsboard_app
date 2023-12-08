abstract class ThingsboardAppConstants {
  // static final thingsBoardApiEndpoint =
  //     'https://elephant.traxmate.io/'; //production
  static final thingsBoardApiEndpoint =
      'https://elephant.staging.traxmate.io/'; //staging

  // static final traxboarderApiEndpoint =
  //     'http://elephant.traxmate.io:5001/'; //production
  static final traxboarderApiEndpoint =
      'http://elephant.staging.traxmate.io:5001/'; //staging

  static final thingsboardOAuth2CallbackUrlScheme = 'org.thingsboard.app.auth';

  /// Not for production (only for debugging)
  static final thingsboardOAuth2AppSecret = 'Your app secret here';
}
