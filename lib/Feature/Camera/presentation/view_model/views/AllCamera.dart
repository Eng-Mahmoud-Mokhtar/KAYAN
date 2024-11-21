import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/Camera/presentation/view_model/views/widgets/DetailesCamera.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';


class MoreCamera {
  final String imageUrl;
  final String location;
  final String name;
  final double rating;
  final double price;
  MoreCamera({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.rating,
    required this.price,
  });
}

class AllCamera extends StatefulWidget {
  const AllCamera({super.key});

  @override
  State<AllCamera> createState() => _AllCameraState();
}

class _AllCameraState extends State<AllCamera> {
  final List<MoreCamera> _CameraList = [
    MoreCamera(
      imageUrl: "images/Service/professional-indian-young-photographer-taking-photos-studio-with-leight.jpg",
      location: "كفرالشيخ",
      name: "استوديو سيلفي",
      rating: 3,
      price: 800,
    ),
    MoreCamera(
      imageUrl: "images/Service/portrait-cheerful-photographer-studio.jpg",
      location: 'المحله',
      name: "استوديو كارنفال",
      rating: 5,
      price: 1200,
    ),
    MoreCamera(
      imageUrl: "images/Service/medium-shot-man-taking-photos.jpg",
      location: 'القاهرة',
      name: "استوديو فوتوسكوب",
      rating: 6,
      price: 1500,
    ),
    MoreCamera(
      imageUrl: "images/camraman.jpg",
      location: 'الجيزة',
      name: "استوديو نسمه",
      rating: 1.0,
      price: 400,
    ),
  ];

  List<MoreCamera> _filteredCamera = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCamera = _CameraList;
  }

  void _filterAcademy(String query) {
    setState(() {
      _filteredCamera = _CameraList.where((Camera) {
        return Camera.name.toLowerCase().contains(query.toLowerCase());
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
            'جلسات التصوير',
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
                _filteredCamera = _CameraList;
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
            _filteredCamera.length,
                (index) {
              final Camera = _filteredCamera[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsCamera(
                          CameraName: Camera.name,
                          location: Camera.location,
                          price: Camera.price.toString(),
                          imagePath: Camera.imageUrl,
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
                          Camera.imageUrl,
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
                                          Camera.location,
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
                                      Camera.name,
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
                                      starIndex < Camera.rating
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
                                  text: '${Camera.price.toInt()} ',                                  style: TextStyle(
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
