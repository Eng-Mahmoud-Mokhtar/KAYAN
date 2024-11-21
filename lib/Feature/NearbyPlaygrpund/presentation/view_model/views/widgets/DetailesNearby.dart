import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../core/colors.dart';
import '../../../../../core/utiles/constans.dart';
import 'NearbySubscribe.dart';

class DetailesNearby extends StatefulWidget {
  final String playgroundName;
  final String location;
  final String price;
  final String imagePath;

  const DetailesNearby({
    required this.playgroundName,
    required this.location,
    required this.price,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailesNearby> createState() => _DetailesNearbyState();
}

class _DetailesNearbyState extends State<DetailesNearby> {
  int _rating = 5;
  bool _showFeatures = true;
  bool _showVideos = false;
  bool _showImages = false;
  VideoPlayerController? _videoController;
  VideoPlayerController? _selectedVideoController;
  bool _isInitialized = false;
  final List<String> _videoPaths = [
    'images/Gym/playground1.mp4',
  ];
  @override
  void initState() {
    super.initState();
    _initializeVideoController(_videoPaths[0]);
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _selectedVideoController?.dispose();
    super.dispose();
  }

  void _initializeVideoController(String path) {
    _selectedVideoController?.dispose();
    _selectedVideoController = VideoPlayerController.asset(path)
      ..initialize().then((_) {
        setState(() {
          _selectedVideoController!.setLooping(true);
        });
      }).catchError((error) {
        print('Error initializing video player: $error');
      });
  }

  void _playVideo(String path) {
    if (_selectedVideoController != null && _selectedVideoController!.dataSource == path) {
      if (_selectedVideoController!.value.isPlaying) {
        _selectedVideoController!.pause();
      } else {
        _selectedVideoController!.play();
      }
    } else {
      _selectedVideoController?.pause();
      _initializeVideoController(path);
    }
  }
  void _updateRating(int index) {
    setState(() {
      _rating = index + 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    double scaleFactor = 0.60;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          'تفاصيل الملعب',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenWidth * scaleFactor,
                  child: Image.asset(
                    widget.imagePath,
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
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * scaleFactor * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.location,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: MediaQuery.of(context).size.width * 0.04,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey,
                                    size: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                ],
                              ),
                              Text(
                                widget.playgroundName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width * 0.05,
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
                                (index) => IconButton(
                              icon: Icon(
                                index < _rating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.red,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                              onPressed: () => _updateRating(index),
                            ),
                          ).reversed.toList(),
                        )
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
                            text: widget.price,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: screenWidth * 0.12,
                          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(screenWidth * 0.9, 50),
                              backgroundColor: !_showFeatures && !_showVideos ? KprimaryColor : Colors.grey[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _showFeatures = false;
                                _showVideos = false;
                                _showImages = true;
                              });
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'صور',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: Container(
                          height: screenWidth * 0.12,

                          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(screenWidth * 0.9, 50),
                              backgroundColor: _showVideos ? KprimaryColor : Colors.grey[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _showFeatures = false;
                                _showVideos = true;
                                _showImages = false;
                              });
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'فيديوهات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: Container(
                          height: screenWidth * 0.12,
                          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(screenWidth * 0.9, 50),
                              backgroundColor: _showFeatures ? KprimaryColor : Colors.grey[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _showFeatures = true;
                                _showVideos = false;
                                _showImages = false;
                              });
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'مميزات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _showFeatures
                        ? _buildFeatures()
                        : _showVideos
                        ? _buildVideos()
                        : _showImages
                        ? _buildImages()
                        : Container(),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NearbySubscribe(),
                    ),
                  );
                },
                child: Container(
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.CheckBoxColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(150, 150, 150, 0.1),
                        offset: Offset(0, 15),
                        blurRadius: 40,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'احجز الان',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
  Widget _buildFeatures() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildFeatureRow('موجود', 'أرضية عشبية ممتازة'),
          _buildFeatureRow('موجود', 'إضاءة ليلية كاملة'),
          _buildFeatureRow('موجود', 'مدرجات للجمهور'),
          _buildFeatureRow('موجود', 'خدمات تغيير الملابس'),
          _buildFeatureRow('غير موجود', 'مسبح بجوار الملعب'),
        ],
      ),
    );
  }
  Widget _buildVideos() {
    return Container(
      height: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _videoPaths.length,
        itemBuilder: (context, index) {
          final videoPath = _videoPaths[index];
          final isSelected = _selectedVideoController != null && _selectedVideoController!.dataSource == videoPath;

          return GestureDetector(
            onTap: () {
              _playVideo(videoPath);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
              color: Colors.black,
              child: Stack(
                children: [
                  if (isSelected)
                    AspectRatio(
                      aspectRatio: _selectedVideoController!.value.aspectRatio,
                      child: VideoPlayer(_selectedVideoController!),
                    ),
                  if (!isSelected)
                    Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildFeatureRow(String availability, String feature) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            availability,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            feature,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImages() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImage('images/Service/soccer-players-action-professional-stadium (1).jpg'),
                _buildImage('images/Service/soccer-players-action-professional-stadium.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImage(String path) {
    final double aspectRatio = 16 / 9;

    return Container(
      margin: EdgeInsets.only(right: 8),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}