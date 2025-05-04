import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/core/constants/my_assets.dart';

class PropertyDescriptionPage extends StatelessWidget {
  const PropertyDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Property Description"),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
      
              Stack(
                children: [
                  Image.asset(
                    MyAssets.houseDetails,
                    height: 369,
                    width: 369,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.share_outlined),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Wings Tower", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("Thamel, Kathmandu", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Text("Rs. 30,000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Tab bar
                    const TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: "Description"),
                        Tab(text: "Gallery"),
                        Tab(text: "Review"),
                      ],
                    ),
                    const SizedBox(height: 16),

    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _FeatureIcon(icon: Icons.bed, label: "3 Bed"),
                        _FeatureIcon(icon: Icons.bathtub_outlined, label: "2 Bath"),
                        _FeatureIcon(icon: Icons.house, label: "Villa"),
                        _FeatureIcon(icon: Icons.square_foot, label: "1800 sqft"),
                      ],
                    ),

                    const Divider(height: 30),

                    // Agent Info
                    Row(
                      children: [
                        // const CircleAvatar(
                        //   radius: 24,
                        //   backgroundImage: AssetImage('assets/images/agent.jpg'), // Replace with real asset
                        // ),
                        // const SizedBox(width: 12),
                        // const Expanded(child: Text("Sandeep S.", style: TextStyle(fontSize: 16))),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message),
                        ),
                      ],
                    ),

                    const Divider(height: 30),

                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      children: const [
                        _FacilityIcon(icon: Icons.local_parking, label: "Parking"),
                        _FacilityIcon(icon: Icons.wifi, label: "Wi-Fi"),
                        _FacilityIcon(icon: Icons.kitchen, label: "Kitchen"),
                        _FacilityIcon(icon: Icons.elevator, label: "Elevator"),
                      ],
                    ),

                    const SizedBox(height: 30),

              
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: Image.asset(
                    //     'assets/images/map.png', // Replace with static map
                    //     height: 160,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),

                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("See on the map", style: TextStyle(color: Colors.blue)),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.indigo),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _FacilityIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FacilityIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black87),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
