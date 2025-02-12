import 'package:flutter/material.dart';

class TrackCargo extends StatelessWidget {
  const TrackCargo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light gray for a premium feel
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4, // Soft shadow effect
        shadowColor: Colors.black26,
        title: const Text(
          "Delivery Details",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map Placeholder with a Classic Look
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black12),
                  child: const Center(
                    child: Text(
                      "Map Placeholder",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            // Delivery Information in a Card
            Expanded(
              flex: 5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DeliveryInfo(
                        title: "Courier Express",
                        address: "880 Park St, Los Angeles, CA 92376",
                      ),
                      const SizedBox(height: 10),
                      _DeliveryInfo(
                        title: "My Location",
                        address: "623 Timbercrest Road, AK 99669",
                      ),
                      const Divider(thickness: 1, height: 30),
                      
                      // Delivery Partner Section
                      _DeliveryPartner(),
                      const Divider(thickness: 1, height: 30),
                      
                      // Package Details
                      _PackageDetails(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Delivery Info Widget (Courier & Destination)
class _DeliveryInfo extends StatelessWidget {
  final String title;
  final String address;

  const _DeliveryInfo({required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          address,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ],
    );
  }
}

// Delivery Partner Widget
class _DeliveryPartner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage("assets/user.jpg"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Jenny Wilson",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "Parcel Delivery Partner",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call, color: Colors.green),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline, color: Colors.blueAccent),
            ),
          ],
        )
      ],
    );
  }
}

// Package Details Widget
class _PackageDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _DetailItem(title: "Package Weight", value: "1.5 KG"),
        _StatusChip(status: "Processing"),
      ],
    );
  }
}

// Reusable Detail Item Widget
class _DetailItem extends StatelessWidget {
  final String title;
  final String value;

  const _DetailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Status Chip Widget
class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color chipColor;
    switch (status.toLowerCase()) {
      case "delivered":
        chipColor = Colors.green;
        break;
      case "processing":
        chipColor = Colors.blueAccent;
        break;
      case "pending":
        chipColor = Colors.orange;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Chip(
      label: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: chipColor,
    );
  }
}
