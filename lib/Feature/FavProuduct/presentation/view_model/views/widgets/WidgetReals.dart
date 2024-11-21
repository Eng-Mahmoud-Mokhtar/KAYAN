import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../../Challenges/presentation/view_model/views/widgets/comment.dart';
import '../../../../../core/utiles/constans.dart';


class WidgetReals extends StatefulWidget {
  @override
  _WidgetRealsState createState() => _WidgetRealsState();
}

class _WidgetRealsState extends State<WidgetReals> {
  late VideoPlayerController _videoController;
  bool _isVideoPlaying = false;
  final String _videoPath = 'images/Gym/videoGym2.mp4';
  int _likesCount = 34;
  bool _isLiked = false;
  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(_videoPath)
      ..initialize().then((_) {
        setState(() {
          _videoController.setLooping(true);
        });
      }).catchError((error) {
        print("Error loading video: $error");
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _isLiked ? _likesCount++ : _likesCount--; // Update likes count based on the current state
    });
  }
  void _playVideo() {
    setState(() {
      if (_isVideoPlaying) {
        _videoController.pause();
      } else {
        _videoController.play();
      }
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.04,
          ),
          child: Container(
            width: screenWidth,
            height: screenWidth * 0.80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(80, 85, 80, 20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              size: 18.sp,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'اسم الشخص',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'منذ اسبوع',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.7),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        backgroundImage: AssetImage('assets/images/Play/Ellipse 495.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // إضافة بادينج جانبي
                  child: Center(
                    child: Expanded(
                      child: GestureDetector(
                        onTap: _playVideo,
                        child: Container(
                          color: Colors.transparent,
                          child: AspectRatio(
                            aspectRatio: 12 / 5,
                            child: VideoPlayer(_videoController),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '34',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w400,                        ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              size: 18.sp,
                              color: KprimaryColor,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: KprimaryColor,
                          size: 18.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return CommentBottomSheet();
                            },
                          );
                        },
                        icon: ImageIcon(
                          AssetImage('assets/images/Play/messagecircledots.png'),
                          color: KprimaryColor,
                          size: 18.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '$_likesCount', // Display likes count
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            onPressed: _toggleLike,
                            icon: Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border, // Change icon based on state
                              color: KprimaryColor,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}