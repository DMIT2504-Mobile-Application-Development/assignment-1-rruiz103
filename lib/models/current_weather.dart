class CurrentWeather {
  String _city;
  String _description;
  double _currentTemp;
  DateTime _currentTime;
  DateTime _sunrise;
  DateTime _sunset;

  CurrentWeather({
    required String city,
    required String description,
    required double currentTemp,
    required DateTime currentTime,
    required DateTime sunrise,
    required DateTime sunset,
  })
      : _city = city,
        _description = description,
        _currentTemp = currentTemp,
        _currentTime = currentTime,
        _sunrise = sunrise,
        _sunset = sunset;

// Getter for City
  String get city => _city;

// Setter for City with validation
  set city(String value) {
    if (value.isEmpty) {
      throw Exception('City cannot be empty');
    }
    _city = value;
  }

// Getter for description
  String get description => _description;

// Setter for description with validation
  set description(String value) {
    if (value.isEmpty) {
      throw Exception('Description cannot be empty');
    }
    _description = value;
  }

  // Getter for currentTemp
  double get currentTemp => _currentTemp;

  // Setter for currentTemp with validation
  set currentTemp(double value) {
    if (value < -100 || value > 100) {
      throw Exception('Temperature must be between -100 and 100');
    }
    _currentTemp = value;
  }

  // Getter for currentTime
  DateTime get currentTime => _currentTime;

  // Setter for currentTime with validation
  set currentTime(DateTime value) {
    final now = DateTime.now();
    if (value.isAfter(now)) {
      throw Exception('Current time cannot be in the future');
    }
    _currentTime = value;
  }

  // Getter for sunrise
  DateTime get sunrise => _sunrise;

  // Setter for sunrise with validation
  set sunrise(DateTime value) {
    if (!_isSameDay(value, _currentTime)) {
      throw Exception('Sunrise must be on the same day as current time');
    }
    if (_sunset != null && value.isAfter(_sunset)) {
      throw Exception('Sunrise cannot be after sunset');
    }
    _sunrise = value;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  // Getter for sunset
  DateTime get sunset => _sunset;

  // Setter for sunset with validation
  set sunset(DateTime value) {
    if (!_isSameDay(value, _currentTime)) {
      throw Exception('Sunset must be on the same day as current time');
    }
    if (_sunrise != null && value.isBefore(_sunrise)) {
      throw Exception('Sunset cannot be before sunrise');
    }
    _sunset = value;
  }

  @override
  String toString() {
    return 'City: $_city, Description: $_description, '
        'Current Temperature: $_currentTemp, Current Time: $_currentTime, '
        'Sunrise: $_sunrise, Sunset: $_sunset';
  }

}


