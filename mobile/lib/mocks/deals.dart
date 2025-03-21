class Deal {
  final int id;
  final String title;
  final String description;
  final double discount;
  final double latitude;
  final double longitude;
  final String category;
  final DateTime expiration;
  final String imageUrl; // Placeholder for deal image

  Deal({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.expiration,
    required this.imageUrl,
  });
}

final List<Deal> mockDeals = [
  Deal(
    id: 1,
    title: "50% Off Pizza",
    description: "Half off any large pizza at Pizza Hut.",
    discount: 50.0,
    latitude: 37.7749,
    longitude: -122.4194,
    category: "Food",
    expiration: DateTime(2025, 4, 1),
    imageUrl: "https://via.placeholder.com/150",
  ),
  Deal(
    id: 2,
    title: "20% Off Clothing",
    description: "Discount on all items at Fashion Store.",
    discount: 20.0,
    latitude: 37.7859,
    longitude: -122.4364,
    category: "Shopping",
    expiration: DateTime(2025, 3, 31),
    imageUrl: "https://via.placeholder.com/150",
  ),
  Deal(
    id: 3,
    title: "Free Movie Ticket",
    description: "Buy one, get one free at Cineplex.",
    discount: 100.0,
    latitude: 37.7959,
    longitude: -122.4264,
    category: "Entertainment",
    expiration: DateTime(2025, 5, 1),
    imageUrl: "https://via.placeholder.com/150",
  ),
];