import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

import 'Playstation_details.dart';

class Playstation {
  final String imageUrl;
  final String location;
  final String name;
  final double rating;
  final double price;

  Playstation({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.rating,
    required this.price,
  });
}

class AllPlaystation extends StatefulWidget {
  const AllPlaystation({super.key});

  @override
  State<AllPlaystation> createState() => _AllPlaystationState();
}

class _AllPlaystationState extends State<AllPlaystation> {
  final List<Playstation> _AllPlaystation = [
    Playstation(
      imageUrl: 'images/New/front-view-father-girl-playing-videogame.jpg',
      location: 'كفرالشيخ',
      name: 'بلايستيشن الجوكر',
      rating: 2,
      price: 50,
    ),
    Playstation(
      imageUrl: 'images/New/gamification-3d-rendering-concept.jpg',
      location: 'المنصورة',
      name: 'بلايستيشن بوكر',
      rating: 5,
      price: 200,
    ),
    Playstation(
      imageUrl: 'images/New/portrait-young-man-sitting-sofa-playing-video-game.jpg',
      location: 'اسكندرية',
      name: 'بلايستيشن ميامي',
      rating: 3,
      price: 100,
    ),
    Playstation(
      imageUrl: 'images/New/side-view-couple-playing-videogame.jpg',
      location: 'المحله',
      name: 'بلايستيشن اسلام',
      rating: 3.0,
      price: 300,
    ),
  ];

  List<Playstation> _filteredPlaystation = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredPlaystation = _AllPlaystation;
  }

  void _filterPlaygrounds(String query) {
    setState(() {
      _filteredPlaystation = _AllPlaystation.where((playground) {
        return playground.name.toLowerCase().contains(query.toLowerCase()) ||
            playground.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = 0.60;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff302F2D),
        centerTitle: true,
        title: AnimatedCrossFade(
          firstChild: Text(
            'بلايستيشن',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.white,
            ),
          ),
          secondChild: Container(
            width: screenWidth * 0.7,
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '...ابحث هنا',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: screenWidth * 0.04,
                ),
                border: InputBorder.none,
              ),
              onChanged: (query) => _filterPlaygrounds(query),
            ),
          ),
          crossFadeState: _isSearching
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        leading: IconButton(
          icon: Icon(
            _isSearching ? Icons.close : Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _isSearching = false;
                _searchController.clear();
                _filteredPlaystation = _AllPlaystation;
              } else {
                _isSearching = true;
              }
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            _filteredPlaystation.length,
                (index) {
              final Playstation = _filteredPlaystation[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaystationDetails(
                          PlaystationName: Playstation.name,
                          location: Playstation.location,
                          price: Playstation.price.toString(),
                          imagePath: Playstation.imageUrl,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenWidth * scaleFactor,
                        child: Image.asset(
                          Playstation.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        height: screenWidth * scaleFactor,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Positioned(
                        left: 0,
                        top: screenWidth * (scaleFactor * 0.66),
                        child: Container(
                          width: screenWidth,
                          color: Colors.black.withOpacity(0.7),
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * scaleFactor * 0.01,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * scaleFactor * 0.04,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          Playstation.location,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.02),
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey,
                                          size: screenWidth * 0.05,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      Playstation.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: List.generate(
                                  5,
                                      (starIndex) => IconButton(
                                    icon: Icon(
                                      starIndex < Playstation.rating
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.red,
                                      size: screenWidth * 0.05,
                                    ),
                                    onPressed: () {},
                                  ),
                                ).reversed.toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: screenWidth * (scaleFactor * 0.4),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * scaleFactor * 0.005,
                            horizontal: screenWidth * 0.04,
                          ),
                          decoration: BoxDecoration(
                            color: KprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'يبدأ من ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '${Playstation.price.toInt()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' جنيه ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
