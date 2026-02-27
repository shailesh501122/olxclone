import 'package:flutter/material.dart';
import '../../widgets/property_card.dart';
import 'property_detail_screen.dart';

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () => showModalBottomSheet(context: context, builder: (_) => const _PropertyFilterSheet()),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: .63,
        ),
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PropertyDetailScreen())),
          child: PropertyCard(
            title: '2 BHK Apartment in Andheri',
            price: i.isEven ? '₹ 95,00,000' : '₹ 28,000 / month',
            specs: '2 BHK • 1200 sqft',
            furnishing: 'Semi Furnished',
            area: 'Andheri West, Mumbai',
            tag: i.isEven ? 'For Sale' : 'For Rent',
            featured: i % 3 == 0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostPropertyScreen())),
        label: const Text('Post Property'),
        icon: const Icon(Icons.add_home_work_outlined),
      ),
    );
  }
}

class _PropertyFilterSheet extends StatelessWidget {
  const _PropertyFilterSheet();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Filters', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      const SizedBox(height: 12),
      const Text('Budget slider'),
      Slider(value: 50, min: 0, max: 100, onChanged: (_) {}),
      const Wrap(spacing: 8, children: [Chip(label: Text('1 BHK')), Chip(label: Text('2 BHK')), Chip(label: Text('3 BHK')), Chip(label: Text('4+ BHK'))]),
      const SizedBox(height: 8),
      const DropdownMenu(dropdownMenuEntries: [DropdownMenuEntry(value: 'Apartment', label: 'Apartment'), DropdownMenuEntry(value: 'House', label: 'House')], hintText: 'Property Type'),
      const SizedBox(height: 8),
      const DropdownMenu(dropdownMenuEntries: [DropdownMenuEntry(value: 'Unfurnished', label: 'Unfurnished'), DropdownMenuEntry(value: 'Semi', label: 'Semi Furnished'), DropdownMenuEntry(value: 'Fully', label: 'Fully Furnished')], hintText: 'Furnishing'),
      const SizedBox(height: 8),
      const DropdownMenu(dropdownMenuEntries: [DropdownMenuEntry(value: '24h', label: '24 hours'), DropdownMenuEntry(value: '7d', label: '7 days'), DropdownMenuEntry(value: '30d', label: '30 days')], hintText: 'Posted within'),
      const SizedBox(height: 10),
      Row(children: const [Text('Sort by: '), SizedBox(width: 8), Chip(label: Text('Price Low to High')), Chip(label: Text('Most Recent'))]),
      const SizedBox(height: 10),
      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: null, child: Text('Apply Filters')))
    ]),
  );
}
