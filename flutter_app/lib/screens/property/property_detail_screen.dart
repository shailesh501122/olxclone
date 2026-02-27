import 'package:flutter/material.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(actions: const [Icon(Icons.share_outlined), SizedBox(width: 8), Icon(Icons.flag_outlined), SizedBox(width: 12)]),
    body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 240,
          child: PageView(children: List.generate(3, (_) => Container(color: const Color(0xffececec)))),
        ),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('₹ 95,00,000', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text('2 BHK Apartment in Andheri West'),
            SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: [
              Chip(label: Text('BHK: 2')), Chip(label: Text('Bathrooms: 2')), Chip(label: Text('Area: 1200 sqft')),
              Chip(label: Text('Floor: 5/12')), Chip(label: Text('Parking: Yes')), Chip(label: Text('Furnishing: Semi')),
            ]),
            SizedBox(height: 12),
            Text('Map Preview'),
            SizedBox(height: 140, child: ColoredBox(color: Color(0xffdbeafe))),
            SizedBox(height: 12),
            ListTile(contentPadding: EdgeInsets.zero, leading: CircleAvatar(child: Icon(Icons.person)), title: Text('Seller: Rahul Sharma'), subtitle: Text('Member since 2022')),
          ]),
        )
      ]),
    ),
    bottomNavigationBar: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(children: [
          Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline), label: const Text('Chat'))),
          const SizedBox(width: 10),
          Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.call), label: const Text('Call'))),
        ]),
      ),
    ),
  );
}

class PostPropertyScreen extends StatelessWidget {
  const PostPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Post Property Ad')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text('Basic Details', style: TextStyle(fontWeight: FontWeight.bold)),
        _LabeledField('Listing Type (Sale/Rent)'),
        _LabeledField('Property Type'),
        _LabeledField('BHK'),
        _LabeledField('Bathrooms'),
        _LabeledField('Furnishing'),
        _LabeledField('Super Built-up Area (sqft)'),
        _LabeledField('Carpet Area'),
        _LabeledField('Total Floors'),
        _LabeledField('Floor Number'),
        _LabeledField('Car Parking (Yes/No)'),
        _LabeledField('Facing'),
        _LabeledField('Age of Property'),
        SizedBox(height: 12),
        Text('Pricing', style: TextStyle(fontWeight: FontWeight.bold)),
        _LabeledField('Expected Price'),
        _LabeledField('Rent per Month'),
        _LabeledField('Security Deposit'),
        _LabeledField('Maintenance Charges'),
        _LabeledField('Price Negotiable (Yes/No)'),
        SizedBox(height: 12),
        Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
        _LabeledField('State'), _LabeledField('City'), _LabeledField('Area'), _LabeledField('Full Address'), _LabeledField('Latitude'), _LabeledField('Longitude'), _LabeledField('Landmark'),
        SizedBox(height: 12),
        Text('Media', style: TextStyle(fontWeight: FontWeight.bold)),
        _LabeledField('Upload Multiple Images'),
        _LabeledField('Video Tour (Optional)'),
        SizedBox(height: 12),
        _LabeledField('Detailed Description', lines: 4),
      ],
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(onPressed: () {}, child: const Text('Submit Property Listing')),
    ),
  );
}

class _LabeledField extends StatelessWidget {
  final String label;
  final int lines;
  const _LabeledField(this.label, {this.lines = 1});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 10),
    child: TextField(maxLines: lines, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder())),
  );
}
