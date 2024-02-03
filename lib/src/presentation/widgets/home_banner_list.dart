import 'package:e_learning/src/domain/entities/banner_model.dart';
import 'package:flutter/material.dart';

class HomeBannerList extends StatelessWidget {
  final List<BannerData> banners;

  const HomeBannerList({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Terbaru',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: banners.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final banner = banners[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 284,
                  height: 146,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    banner.eventImage ?? '',
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
