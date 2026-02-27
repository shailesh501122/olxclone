import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _categories = const [
    'Cars','Properties','Mobiles','Jobs','Fashion','Bikes','Electronics','Commercial','Furniture','Pets'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black26)]),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
          Icon(Icons.home), Icon(Icons.chat_bubble_outline), SizedBox(width: 40), Icon(Icons.campaign_outlined), Icon(Icons.person_outline),
        ]),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildTopBar()),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, i) => Column(children: [
                  Container(height: 54, width: 54, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12))),
                  const SizedBox(height: 4),
                  Text(_categories[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 11))
                ]), childCount: _categories.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: .9),
              ),
            ),
            SliverToBoxAdapter(child: _eliteBanner()),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((_, __) => _listingCard(), childCount: 6),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: .72),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() => Padding(
    padding: const EdgeInsets.all(12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Text('OLX', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), Spacer(), Icon(Icons.favorite_border), SizedBox(width: 10), Icon(Icons.notifications_none)]),
      const SizedBox(height: 8),
      Row(children: const [Icon(Icons.location_on_outlined), SizedBox(width: 4), Text('India'), Icon(Icons.keyboard_arrow_down)]),
      const SizedBox(height: 10),
      TextField(decoration: InputDecoration(prefixIcon: const Icon(Icons.search), suffixIcon: const Icon(Icons.mic_none), hintText: 'Find Cars, Mobile Phones and more...', filled: true, fillColor: Colors.grey.shade100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
    ]),
  );

  Widget _eliteBanner() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: const Color(0xffeef8ff), borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Become an Elite Buyer', style: TextStyle(fontWeight: FontWeight.bold)), Text('Call Owners Directly')])), Chip(label: Text('Buy Now'))]),
  );

  Widget _listingCard() => Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300), boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)]),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Stack(children: [Container(decoration: const BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.vertical(top: Radius.circular(12)))), const Positioned(top: 8, left: 8, child: Chip(label: Text('FEATURED'))), const Positioned(top: 8, right: 8, child: Icon(Icons.favorite_border))])),
      const Padding(padding: EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('₹ 12,000', style: TextStyle(fontWeight: FontWeight.bold)), Text('iPhone 12 in great condition', maxLines: 2), Row(children: [Icon(Icons.location_on_outlined, size: 14), Text('Mumbai', style: TextStyle(fontSize: 12))])]))
    ]),
  );
}
