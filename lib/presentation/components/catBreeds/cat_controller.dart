import 'dart:convert';
import 'package:catbreeds/core/models/cat_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CatBreedsController extends GetxController {
  final breeds = <CatBreed>[].obs;
    final filteredBreeds = <CatBreed>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatBreeds();
  }

 Future<void> fetchCatBreeds() async {
  final url = Uri.parse('https://api.thecatapi.com/v1/breeds');
  try {
    final response = await http.get(
      url,
      headers: {
        'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      breeds.assignAll(data.map((json) => CatBreed.fromJson(json)).toList());
    } else {
      // Manejar errores de la petición
      throw Exception('Failed to load cat breeds: ${response.statusCode}');
    }
  } catch (e) {
     if (e is http.ClientException) {
      // Error de cliente HTTP (p. ej., 400, 401)
      print('Error de cliente HTTP: ${e.message}');
      // Manejar el código de estado específico aquí
      if (e.message.contains('400')) {
        // Manejar el error 400 (Bad Request)
      } else if (e.message.contains('401')) {
        // Manejar el error 401 (Unauthorized)
      } else if (e.message.contains('500')) {
        // Manejar el error 500 (Internal Server Error)
      } else {
        // Otros errores de cliente HTTP
      }
    } else {
      // Otros errores
      print('Error desconocido: $e');
    }
  }
}


  
  void searchBreedsByName(String name) {
    if (name.isEmpty) { 
      filteredBreeds.assignAll(breeds); // Show all breeds when search text is empty
    } else {
      filteredBreeds.assignAll(
        breeds.where((breed) => breed.name.toLowerCase().contains(name.toLowerCase())).toList(),
      );
    }
  }
}
