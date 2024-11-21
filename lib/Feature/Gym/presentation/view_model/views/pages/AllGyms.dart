import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import 'Detailes.dart';

class MoreGyms {
  final String imageUrl;
  final String location;
  final String name;
  final double rating;
  final double price;
  MoreGyms({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.rating,
    required this.price,
  });

}

class AllGyms extends StatefulWidget {
  const AllGyms({super.key});

  @override
  State<AllGyms> createState() => _AllGymsState();
}

class _AllGymsState extends State<AllGyms> {
  final List<MoreGyms> _gymList = [
    MoreGyms(
      imageUrl: "images/Gym/young-sportive-man-is-doing-exercises-with-dumbbells-empty-gym-club.jpg",
      location: 'الجيزة',
      name: "هيرو جيم",
      rating: 2,
      price: 250,
    ),
    MoreGyms(
      imageUrl: 'images/Gym/sportsman-doing-squats-gym.jpg',
      location: 'الجيزة',
      name: 'جولدز جيم',
      rating: 1.5,
      price: 170,
    ),
    MoreGyms(
      imageUrl: 'images/Gym/full-body-portrait-athletic-shirtless-male-doing-biceps-workouts-with-dumbbells-gym-club.jpg',
      location: 'كفرالشيخ',
      name: 'باور تايم جيم',
      rating: 4,
      price: 180,
    ),
    MoreGyms(
      imageUrl: 'images/Gym/portrait-young-sportsman-making-cardio-workout-drinking-water-gym.jpg',
      location: 'مدينة نصر',
      name: 'فيتنس جيم',
      rating: 3.0,
      price: 500,
    ),
  ];

  List<MoreGyms> _filteredGyms = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredGyms = _gymList;
  }

  void _filterGyms(String query) {
    setState(() {
      _filteredGyms = _gymList.where((gym) {
        return gym.name.toLowerCase().contains(query.toLowerCase());
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
        backgroundColor: Color(0xff302F2D),
        centerTitle: true,
        title: AnimatedCrossFade(
          firstChild: Text(
            'الجيمات',
            style: TextStyle(
                fontSize: screenWidth * 0.04
                ,color: Colors.white),
          ),
          secondChild: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '...ابحث هنا',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: MediaQuery.of(context).size.width * 0.04, // تكبير حجم النص هنا
                ),
                border: InputBorder.none,
              ),
              onChanged: (query) => _filterGyms(query),
            )
            ,
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
                _filteredGyms = _gymList;
              } else {
                _isSearching = true;
              }
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            _filteredGyms.length,
                (index) {
              final gym = _filteredGyms[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          GymName: gym.name,
                          location: gym.location,
                          price: gym.price.toString(),
                          imagePath: gym.imageUrl,
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
                          gym.imageUrl,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          gym.location,
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
                                      gym.name,
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
                                      starIndex < gym.rating
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
                                  text: '${gym.price.toInt()} ',
                                  style: TextStyle(
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
