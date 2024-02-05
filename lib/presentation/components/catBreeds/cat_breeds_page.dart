// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/presentation/components/catBreeds/cat_controller.dart';
import 'package:catbreeds/presentation/components/carBreedsDetail/cat_detail_page.dart';
import 'package:catbreeds/presentation/components/catBreeds/widgets/result_search.dart';
import 'package:catbreeds/ui/widgets/text_default_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatBreedsPage extends StatelessWidget {
  final CatBreedsController _controller = Get.put(CatBreedsController());
  final TextEditingController _searchController = TextEditingController();
  var showAllBreeds = true.obs;

  CatBreedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 237, 248),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 249, 237, 248),
        title: FadeInUp(
          child: const Center(
            child: TextDefault(
              sizeText: 30,
              colorText: Color.fromARGB(255, 51, 1, 60),
              text: "Cat Breeds",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: BounceInUp(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search by name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Ajusta el valor según tus preferencias
                        ),
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 8),
                BounceInUp(
                  child: ElevatedButton(
                      onPressed: () {
                        _controller.searchBreedsByName(_searchController.text);
                        showAllBreeds.value = false;
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.pets,
                              color: Color.fromARGB(255, 51, 1, 60), size: 20),
                          SizedBox(width: 8),
                          TextDefault(
                            sizeText: 14,
                            colorText: Color.fromARGB(255, 51, 1, 60),
                            text: "Search",
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          HomeView(showAllBreeds: showAllBreeds, controller: _controller),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.showAllBreeds,
    required CatBreedsController controller,
  }) : _controller = controller;

  final RxBool showAllBreeds;
  final CatBreedsController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => showAllBreeds.value
            ? ListView.builder(
                itemCount: _controller.breeds.length,
                itemBuilder: (context, index) {
                  final breed = _controller.breeds[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => CatDetailPage(breed: breed));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  FadeInLeft(
                                    child: TextDefault(
                                      sizeText: 16,
                                      colorText: const Color.fromARGB(
                                          255, 51, 1, 60),
                                      text: breed.name,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  FadeInRight(
                                    child: const TextDefault(
                                      sizeText: 14,
                                      colorText:
                                          Color.fromARGB(255, 51, 1, 60),
                                      text: "See more...",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              FutureBuilder(
                                future: Future.delayed(
                                    const Duration(seconds: 2)),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child:
                                            CircularProgressIndicator());
                                  } else {
                                    return BounceInUp(
                                      child: Center(
                                        child: Container(
                                          height: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
                                              ),
                                              fit: BoxFit
                                                  .cover, // Ajusta la imagen al tamaño del container
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Row(
                                children: [
                                  FadeInUp(
                                    child: TextDefault(
                                      sizeText: 14,
                                      colorText: const Color.fromARGB(
                                          255, 51, 1, 60),
                                      text: breed.origin,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  FadeInUp(
                                    child: const TextDefault(
                                      sizeText: 14,
                                      colorText:
                                          Color.fromARGB(255, 51, 1, 60),
                                      text: "Intelligence:",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  FadeInUp(
                                    child: TextDefault(
                                      sizeText: 14,
                                      colorText: const Color.fromARGB(
                                          255, 51, 1, 60),
                                      text: breed.intelligence.toString(),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : BuilderResultSearch(controller: _controller),
      ),
    );
  }
}
