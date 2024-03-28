import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:school_app/app.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(App()));
}
