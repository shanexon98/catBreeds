import 'package:catbreeds/presentation/components/carBreedsDetail/cat_detail_page.dart';
import 'package:catbreeds/presentation/components/catBreeds/cat_controller.dart';
import 'package:catbreeds/ui/widgets/text_default_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BuilderResultSearch extends StatelessWidget {
  const BuilderResultSearch({
    super.key,
    required CatBreedsController controller,
  }) : _controller = controller;

  final CatBreedsController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _controller.filteredBreeds.length,
        itemBuilder: (context, index) {
          final breed = _controller.filteredBreeds[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => CatDetailPage(breed: breed));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextDefault(
                        sizeText: 16,
                        colorText:
                            const Color.fromARGB(255, 51, 1, 60),
                        text: breed.name,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: Future.delayed(
                        const Duration(seconds: 2)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else {
                        return Center(
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
                        );
                      }
                    },
                  ),
                  Row(
                    children: [
                      TextDefault(
                        sizeText: 14,
                        colorText:
                            const Color.fromARGB(255, 51, 1, 60),
                        text: breed.origin,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const TextDefault(
                        sizeText: 14,
                        colorText: Color.fromARGB(255, 51, 1, 60),
                        text: "Intelligence:",
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(width: 8),
                      TextDefault(
                        sizeText: 14,
                        colorText:
                            const Color.fromARGB(255, 51, 1, 60),
                        text: breed.intelligence.toString(),
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}