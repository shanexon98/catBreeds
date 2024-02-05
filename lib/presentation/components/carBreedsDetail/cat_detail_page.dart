import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/core/models/cat_model.dart';
import 'package:catbreeds/ui/widgets/details_row_widget.dart';
import 'package:catbreeds/ui/widgets/text_default_widget.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {
  final CatBreed breed;

  const CatDetailPage({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextDefault(
          sizeText: 30,
          colorText: const Color.fromARGB(255, 51, 1, 60),
          text: breed.name,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                maxHeight: 250,
                minHeight: 250,
                child: Image.network(
                  'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInLeft(
                  child: const TextDefault(
                    sizeText: 18,
                    colorText: Color.fromARGB(255, 51, 1, 60),
                    text: "Description:",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                FadeInLeft(
                  child: TextDefault(
                    sizeText: 14,
                    overflow: TextOverflow.visible,
                    colorText: const Color.fromARGB(255, 51, 1, 60),
                    text: breed.description,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                DetailsRow(
                  resume: breed.intelligence.toString(),
                  title: 'Intelligence:',
                ),
                DetailsRow(
                  resume: breed.origin,
                  title: 'Country:',
                ),
                DetailsRow(
                  resume: breed.lifeSpan,
                  title: 'Life Span:',
                ),
                DetailsRow(
                  resume: breed.temperament,
                  title: 'Temperament:',
                ),
                DetailsRow(
                  resume: breed.adaptability.toString(),
                  title: 'Adaptability:',
                ),
                DetailsRow(
                  resume: breed.affectionLevel.toString(),
                  title: 'Affection Level:',
                ),
                DetailsRow(
                  resume: breed.childFriendly.toString(),
                  title: 'Child Friendly:',
                ),
                DetailsRow(
                  resume: breed.dogFriendly.toString(),
                  title: 'Dog Friendly:',
                ),
                DetailsRow(
                  resume: breed.energyLevel.toString(),
                  title: 'Energy Level:',
                ),
                DetailsRow(
                  resume: breed.grooming.toString(),
                  title: 'Grooming:',
                ),
                DetailsRow(
                  resume: breed.healthIssues.toString(),
                  title: 'Health Issues:',
                ),
                DetailsRow(
                  resume: breed.sheddingLevel.toString(),
                  title: 'Shedding Level:',
                ),
                DetailsRow(
                  resume: breed.socialNeeds.toString(),
                  title: 'Social Needs:',
                ),
                DetailsRow(
                  resume: breed.strangerFriendly.toString(),
                  title: 'Stranger Friendly:',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
