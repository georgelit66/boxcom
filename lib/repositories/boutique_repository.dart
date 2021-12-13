import 'package:boxcom/data/boutiques.dart';
import 'package:boxcom/models/boutique_model.dart';

class BoutiqueRepository {
  List<Boutique> fetchBoutiques() {
    if (boutiques.isNotEmpty) {
      try {
        return boutiques;
      } catch (e) {
        throw (e.runtimeType);
      }
    } else {
      return [];
    }
  }
}

class BoxcomApiException implements Exception {
  final int statusCode;
  BoxcomApiException(this.statusCode);
}
