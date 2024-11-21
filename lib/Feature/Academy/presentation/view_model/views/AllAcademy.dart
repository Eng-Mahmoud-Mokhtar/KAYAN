import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/Academy/presentation/view_model/views/widgets/DetailesAcademy.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';


class MoreAcademy {
  final String imageUrl;
  final String location;
  final String name;
  final double rating;
  final double price;
  MoreAcademy({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.rating,
    required this.price,
  });
}

class AllAcademy extends StatefulWidget {
  const AllAcademy({super.key});

  @override
  State<AllAcademy> createState() => _AllAcademyState();
}

class _AllAcademyState extends State<AllAcademy> {
  final List<MoreAcademy> _AcademyList = [
    MoreAcademy(
      imageUrl: "images/academy/full-shot-kids-playing-football-together.jpg",
      location: 'القاهرة',
      name: "اكاديميه اسكور",
      rating: 2,
      price: 950,
    ),
    MoreAcademy(
      imageUrl: 'images/academy/man-training-kids-playing-football-full-shot.jpg',
      location: 'الجيزة',
      name: 'اكاديميه فوتبولر',
      rating: 1.5,
      price: 650,
    ),
    MoreAcademy(
      imageUrl: 'images/academy/girl-taking-swiming-lesson-male-coach-dad-helping-her-with-goggles-while-swimming.jpg',
      location: 'القاهرة',
      name: 'اكاديميه الغواصين',
      rating: 4,
      price: 1200,
    ),
    MoreAcademy(
      imageUrl: 'images/academy/young-basketball-players-playing-one-one.jpg',
      location: 'الجيزة',
      name: 'اكاديميه السله',
      rating: 3.0,
      price: 1300,
    ),
  ];

  List<MoreAcademy> _filteredAcademy = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredAcademy = _AcademyList;
  }

  void _filterAcademy(String query) {
    setState(() {
      _filteredAcademy = _AcademyList.where((Academy) {
        return Academy.name.toLowerCase().contains(query.toLowerCase());
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
            'الاكاديميات',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.white,
            ),
          ),
          secondChild: SizedBox(
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
              onChanged: _filterAcademy,
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
                _filteredAcademy = _AcademyList;
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
            _filteredAcademy.length,
                (index) {
              final Academy = _filteredAcademy[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsAcademy(
                          AcademyName: Academy.name,
                          location: Academy.location,
                          price: Academy.price.toString(),
                          imagePath: Academy.imageUrl,
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
                          Academy.imageUrl,
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
                                          Academy.location,
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
                                      Academy.name,
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
                                      starIndex < Academy.rating
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
                        right: screenWidth * 0.0,
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
                                  text: '${Academy.price.toInt()} ',                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'جنيه',
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
