import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'BallPooldetails.dart';

class BallPool {
  final String imageUrl;
  final String location;
  final String name;
  final double rating;
  final double price;

  BallPool({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.rating,
    required this.price,
  });
}

class AllBallPool extends StatefulWidget {
  const AllBallPool({super.key});

  @override
  State<AllBallPool> createState() => _AllBallPoolState();
}

class _AllBallPoolState extends State<AllBallPool> {
  final List<BallPool> _BallPools = [
    BallPool(
      imageUrl: 'images/New/high-angle-arrangement-with-triangle-pool-balls.jpg',
      location: 'كفرالشيخ',
      name: 'بلياردو الجوكر',
      rating: 3,
      price: 20,
    ),
    BallPool(
      imageUrl: 'images/New/medium-shot-guys-with-pool-cues-looking-pool-table.jpg',
      location: 'المنصورة',
      name: 'بلياردو بلوك',
      rating: 5,
      price: 50,
    ),
    BallPool(
      imageUrl: 'images/New/medium-shot-man-holding-pool-cue-ball.jpg',
      location: 'اسكندرية',
      name: 'بلياردو العجمي',
      rating: 2,
      price: 15,
    ),
    BallPool(
      imageUrl: 'images/New/medium-shot-happy-guy-with-grey-vest.jpg',
      location: 'المحله',
      name: 'بلياردو فهد',
      rating: 4.0,
      price: 30,
    ),
  ];

  List<BallPool> _filteredBallPool = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredBallPool = _BallPools;
  }

  void _filterPlaygrounds(String query) {
    setState(() {
      _filteredBallPool = _BallPools.where((BallPool) {
        return BallPool.name.toLowerCase().contains(query.toLowerCase()) ||
            BallPool.location.toLowerCase().contains(query.toLowerCase());
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
            'بلياردو',
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
                _filteredBallPool = _BallPools;
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
            _filteredBallPool.length,
                (index) {
              final BallPool = _filteredBallPool[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BallPoolDetails(
                          BallPoolName: BallPool.name,
                          location: BallPool.location,
                          price: BallPool.price.toString(),
                          imagePath: BallPool.imageUrl,
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
                          BallPool.imageUrl,
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
                                          BallPool.location,
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
                                      BallPool.name,
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
                                      starIndex < BallPool.rating
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
                                  text: '${BallPool.price.toInt()}',
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
