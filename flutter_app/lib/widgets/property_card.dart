import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String price;
  final String specs;
  final String furnishing;
  final String area;
  final String tag;
  final bool featured;

  const PropertyCard({
    super.key,
    required this.title,
    required this.price,
    required this.specs,
    required this.furnishing,
    required this.area,
    required this.tag,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xfff0f0f0),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
            if (featured)
              const Positioned(top: 8, left: 8, child: Chip(label: Text('FEATURED'))),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.favorite_border, size: 16),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(specs, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(furnishing, style: const TextStyle(fontSize: 12)),
            Text(area, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(20)),
              child: Text(tag, style: const TextStyle(fontSize: 11)),
            ),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ]),
        )
      ]),
    );
  }
}
