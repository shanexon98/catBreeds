import 'dart:convert';
import 'package:catbreeds/cat_model.dart';
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
    }
  }

  //  void searchBreedsByName(String name) {
  //   filteredBreeds.assignAll(breeds.where((breed) => breed.name.toLowerCase().contains(name.toLowerCase())).toList());
  // }
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
