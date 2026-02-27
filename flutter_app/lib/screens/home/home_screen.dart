import 'package:flutter/material.dart';
import '../../widgets/property_card.dart';
import '../property/property_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _categories = const [
    'Cars', 'Properties', 'Mobiles', 'Jobs', 'Fashion', 'Bikes', 'Electronics & Appliances', 'Commercial Vehicles', 'Furniture', 'Pets'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Colors.teal, Colors.cyan, Colors.orange])),
        child: FloatingActionButton(onPressed: () {}, backgroundColor: Colors.white, child: const Icon(Icons.add, color: Colors.black)),
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _NavIcon(Icons.home, 'Home'), _NavIcon(Icons.chat_bubble_outline, 'Chats'), SizedBox(width: 38), _NavIcon(Icons.campaign_outlined, 'My Ads'), _NavIcon(Icons.person_outline, 'Account')
          ]),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: _buildTopBar()),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, i) => Column(children: [
                Container(height: 54, width: 54, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12))),
                const SizedBox(height: 4),
                Text(_categories[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 10.5))
              ]), childCount: _categories.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: .82),
            ),
          ),
          SliverToBoxAdapter(child: _eliteBanner()),
          const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(12, 14, 12, 8), child: Text('Fresh recommendations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((_, i) => PropertyCard(
                title: '2 BHK Apartment in Andheri',
                price: i.isEven ? '₹ 95,00,000' : '₹ 32,000/month',
                specs: '2 BHK • 1200 sqft',
                furnishing: 'Semi Furnished',
                area: 'Andheri West, Mumbai',
                tag: i.isEven ? 'For Sale' : 'For Rent',
                featured: i % 2 == 0,
              ), childCount: 4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: .63),
            ),
          ),
          const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(12, 16, 12, 8), child: Text('Recently viewed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, i) => SizedBox(width: 170, child: PropertyCard(
                  title: '1 BHK Studio',
                  price: '₹ 18,000',
                  specs: '1 BHK • 580 sqft',
                  furnishing: 'Fully Furnished',
                  area: 'Powai',
                  tag: 'For Rent',
                  featured: false,
                )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PropertyListScreen())),
                icon: const Icon(Icons.real_estate_agent_outlined),
                label: const Text('Browse Real Estate Module'),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildTopBar() => Padding(
    padding: const EdgeInsets.all(12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Text('OLX', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), Spacer(), Icon(Icons.favorite_border), SizedBox(width: 10), Icon(Icons.notifications_none)]),
      const SizedBox(height: 8),
      const Row(children: [Icon(Icons.location_on_outlined), SizedBox(width: 4), Text('India'), Icon(Icons.keyboard_arrow_down)]),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.mic_none),
          hintText: 'Find Cars, Mobile Phones and more...',
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
    ]),
  );

  Widget _eliteBanner() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: const Color(0xffeef8ff), borderRadius: BorderRadius.circular(12)),
    child: const Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Become an Elite Buyer', style: TextStyle(fontWeight: FontWeight.bold)), Text('Call Owners Directly')])), Chip(label: Text('Buy Now'))]),
  );
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _NavIcon(this.icon, this.label);

  @override
  Widget build(BuildContext context) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon), Text(label, style: const TextStyle(fontSize: 11))]);
}
