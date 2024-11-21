import 'package:flutter/material.dart';
import 'package:homepage/Feature/Playground/presentation/view_model/views/stadium_details.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

class Playground {
  final String imageUrl;
  final String location;
  final String name;
  final double rating;
  final double price;

  Playground({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.rating,
    required this.price,
  });
}

class Stadiums extends StatefulWidget {
  const Stadiums({super.key});

  @override
  State<Stadiums> createState() => _StadiumsState();
}

class _StadiumsState extends State<Stadiums> {
  final List<Playground> _playgrounds = [
    Playground(
      imageUrl: 'images/o_s_6_758_sultan-ibrahim-larki-1.jpg',
      location: 'كفرالشيخ',
      name: 'ملعب فيوتشر',
      rating: 2,
      price: 300,
    ),
    Playground(
      imageUrl: 'images/Service/full-shot-men-soccer-field.jpg',
      location: 'المنصورة',
      name: 'ملعب نيوز',
      rating: 1.5,
      price: 170,
    ),
    Playground(
      imageUrl: 'images/Service/soccer-players-action-professional-stadium (1).jpg',
      location: 'اسكندرية',
      name: 'ملعب الشيخ',
      rating: 4,
      price: 400,
    ),
    Playground(
      imageUrl: 'images/Gym/football-trainer-teaching-children-side-view.jpg',
      location: 'قنا',
      name: 'ملعب الشيخ',
      rating: 3.0,
      price: 300,
    ),
  ];

  List<Playground> _filteredPlayground = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredPlayground = _playgrounds;
  }

  void _filterPlaygrounds(String query) {
    setState(() {
      _filteredPlayground = _playgrounds.where((playground) {
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
            'ملاعب',
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
                _filteredPlayground = _playgrounds;
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
            _filteredPlayground.length,
                (index) {
              final playground = _filteredPlayground[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StadiumDetails(
                          StadiumName: playground.name,
                          location: playground.location,
                          price: playground.price.toString(),
                          imagePath: playground.imageUrl,
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
                          playground.imageUrl,
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
                                          playground.location,
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
                                      playground.name,
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
                                      starIndex < playground.rating
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
                                  text: '${playground.price.toInt()}',
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
