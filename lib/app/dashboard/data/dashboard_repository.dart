import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:maga_app/app/dashboard/data/models/gastro_model.dart';

/// This Repository handles all json requests that are related to the dashboard
class DashboardRepository {
  Future<List<GastroModel>> getGastros() async {
    final response = await rootBundle.loadStructuredData(
        'assets/data/gastros.json', (x) async => jsonDecode(x));

    return response.map<GastroModel>((x) => GastroModel.fromMap(x)).toList();
  }
}
