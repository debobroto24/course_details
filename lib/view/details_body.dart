import 'package:coursedetails/model/course_model.dart';
import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:coursedetails/view/widget/buttons/fill_button.dart';
import 'package:coursedetails/view/widget/buttons/transferrent_btn.dart';
import 'package:coursedetails/view/widget/customIcon/icon_and_text.dart';
import 'package:coursedetails/view/widget/customIcon/small_text_icon.dart';
import 'package:coursedetails/view/widget/customIcon/svg_icon.dart';
import 'package:coursedetails/view/widget/star_rating.dart';
import 'package:coursedetails/view/widget/text/kread_more.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class DetailsBody extends StatefulWidget {
  final CourseModel details;
  DetailsBody({required this.details});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  bool showAllItems = false;
  bool ShowAllLessionItem = false;
  List<bool> _isExpandedList = [];
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
        bool _isPlaying = false;
  bool _showButton = true;
  @override
  void initState() {
    super.initState();
    _isExpandedList = List.filled(widget.details.data!.sections!.length, false);
     _videoPlayerController = VideoPlayerController.network(
      widget.details.data!.videoLinkPath!,
    )..initialize().then((_) {
        setState(() {});
      });
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isPlaying) {
        setState(() {
          _isPlaying = true;
          _showButton = false;
        });
      } else {
        setState(() {
          _isPlaying = false;
          _showButton = true;
        });
      }
    });

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
             
              Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: GestureDetector(
                  onTap: () {
                    if (_videoPlayerController.value.isPlaying) {
                      _videoPlayerController.pause();
                    } else {
                      _videoPlayerController.play();
                    }
                    setState(() {
                      _isPlaying = !_isPlaying;
                      _showButton = !_showButton;
                    });
                  },
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Visibility(
                  visible: _showButton,
                  child: InkWell(  
                    onTap: (){
                             if (_videoPlayerController.value.isPlaying) {
                        _videoPlayerController.pause();
                      } else {
                        _videoPlayerController.play();
                      }
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    child:SvgPicture.asset("assets/images/play.svg"),
                  ),
               
                ),
              ),
            ),
          ],
        ),
            SizedBox(height: Dimensions.height20 * 2),

            Text(
              widget.details.data!.title ?? "",
              style: title.copyWith(color: AppColors.titleColor),
            ),
            SizedBox(height: Dimensions.height20),
            KReadMore(
              text: widget.details.data!.subTitle ?? "",
              maxLength: 100,
            ),
            SizedBox(height: Dimensions.height15),
            Row(
              children: [
                Text("5.0",
                    style: subtitle2.copyWith(color: AppColors.titleColor)),
                SizedBox(width: Dimensions.height10),
                StarRating(
                  starCount: 5,
                  rating: 5, // Set the initial rating here
                  onRatingChanged: (rating) {},
                ),
                SizedBox(width: Dimensions.height10),
                Text(
                  "(25,00.)",
                  style: subtitle4.copyWith(color: AppColors.subtitleColor),
                )
              ],
            ),
            SizedBox(height: Dimensions.height10),
            Text(
              "9,591 students",
              style: subtitle4.copyWith(color: AppColors.textColor),
            ),
            SizedBox(height: Dimensions.height20),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Mentor ",
                  style: subtitle.copyWith(color: AppColors.textColor)),
              TextSpan(
                  text: "Ashutosh Pawar",
                  style: subtitle.copyWith(color: AppColors.primaryColor))
            ])),
            SizedBox(height: Dimensions.height20),
            const SmallTextIcon(
              iconPath: 'assets/images/appointment1.png',
              text: "Last update 06/2023",
            ),
            SizedBox(height: Dimensions.height10 * .8),
            const SmallTextIcon(
              iconPath: 'assets/images/globe.png',
              text: "English",
            ),
            SizedBox(height: Dimensions.height20 * 1.5),
            Text(
              "BDT ${widget.details.data!.price.toString()}" ?? "",
              style: title3.copyWith(color: AppColors.textColor),
            ),
            SizedBox(height: Dimensions.height10),
            FillButton(text: "Buy now", onTap: () {}),
            SizedBox(height: Dimensions.height20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TransferrentBtn(text: "Add to cart"),
                TransferrentBtn(text: "Add to wishlist"),
              ],
            ),
            SizedBox(height: Dimensions.height30),
            //learning topic
            learningTopiList(widget.details!.data!.learningTopic),
            // section
            SizedBox(height: Dimensions.height30),
            Text("Course Curriculum",
                style: title4.copyWith(color: AppColors.titleColor)),
            SizedBox(height: Dimensions.height20),
            // all section
            ...sectionList().toList(),
            SizedBox(height: Dimensions.height20),

            InkWell(
              onTap: () {
                setState(() {
                  ShowAllLessionItem = !ShowAllLessionItem;
                });
              },
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height20 * 3.5,
                decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    border: Border.all(width: 1, color: AppColors.primaryColor),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius15 / 2)),
                alignment: Alignment.center,
                child: Text(
                  ShowAllLessionItem
                      ? "0 more sections"
                      : "${widget.details.data!.sections!.length - 2} more sections",
                  style: btnText2.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Text("This course includes",
                style: title4.copyWith(color: AppColors.titleColor)),
            const IconAndText(
                text: "34.5 total hours on-demand vedio",
                iconPath: 'assets/images/youtube1.png'),
            const IconAndText(
                text: "Support Files", iconPath: 'assets/images/document1.png'),
            const IconAndText(
                text: "10 Articles", iconPath: 'assets/images/book1.png'),
            const IconAndText(
                text: "Full lifetime access",
                iconPath: 'assets/images/infinity1.png'),
            const IconAndText(
                text: "Access on mobile, desktop, and TV",
                iconPath: 'assets/images/smartphone1.png'),
            const IconAndText(
                text: "Certificate of Completion",
                iconPath: 'assets/images/certificate1.png'),

            SizedBox(height: Dimensions.height30 * 1.5),
            Text("Requiments",
                style: title4.copyWith(color: AppColors.titleColor)),
            SizedBox(height: Dimensions.height20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: AppColors.primaryColor),
                ),
                SizedBox(width: Dimensions.height10),
                Expanded(
                    child: Text(
                  widget.details.data!.requirements ?? "",
                  style: btnText2.copyWith(color: AppColors.titleColor),
                )),
              ],
            ),
            SizedBox(height: Dimensions.height30),

            Text("Description",
                style: title4.copyWith(color: AppColors.titleColor)),
            SizedBox(height: Dimensions.height20),
            Text(
              widget.details.data!.description ?? "",
              style: subtitle5.copyWith(color: AppColors.textColor),
            ),
            SizedBox(height: Dimensions.height30),
          ],
        ),
      ),
    );
  }

  List<Container> sectionList() {
    return List.generate(
        ShowAllLessionItem ? widget.details.data!.sections!.length : 2,
        (index) {
      var section = widget.details.data!.sections![index];
      return Container(
        margin: EdgeInsets.only(top: Dimensions.height15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15 / 2),
        ),
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _isExpandedList[index] = !isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              backgroundColor: AppColors.white,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    "Section -${index + 1}-${section.topic}" ?? "",
                    style: title5.copyWith(
                      color: _isExpandedList[index]
                          ? AppColors.secondaryColor
                          : AppColors.textColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    setState(() {
                      _isExpandedList[index] = !_isExpandedList[index];
                    });
                  },
                );
              },
              body: Column(
                children: section.lessons!.map((lesson) {
                  return ListTile(
                    title: Text(
                      lesson.lectureTitle ?? "",
                      style: subtitle3.copyWith(color: AppColors.textColor),
                    ),
                    onTap: () {
                      // Handle onTap for each lesson
                      if (lesson.videoLinkPath != null) {
                        // Open video link or perform any action
                      }
                    },
                  );
                }).toList(),
              ),
              isExpanded: _isExpandedList[index],
            ),
          ],
        ),
      );
    });
  }

  Widget learningTopiList(List<String>? topic) {
    if (topic != null) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("What you'll learn?",
            style: title4.copyWith(color: AppColors.titleColor)),
        ...topic!.take(showAllItems ? topic.length : 2).map((text) {
          return Padding(
            padding: EdgeInsets.only(top: Dimensions.height10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: AppColors.primaryColor),
                ),
                SizedBox(width: Dimensions.height10),
                Expanded(
                    child: Text(
                  toCamelCase(text),
                  style: subtitle5.copyWith(color: AppColors.textColor),
                )),
              ],
            ),
          );
        }).toList(),
        TextButton(
          onPressed: () {
            setState(() {
              showAllItems = !showAllItems; // Toggle showAllItems
            });
          },
          child: Text(
            showAllItems ? "Show less" : "Show more",
            style: subtitle5.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ]);
    } else {
      return SizedBox();
    }
  }

  String toCamelCase(String text) {
    List<String> words = text.split(' ');
    List<String> camelCaseWords = words.map((word) {
      if (word.isEmpty) {
        return word; // Retain empty words
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).toList();
    String camelCaseText = camelCaseWords.join(' ');

    return camelCaseText;
  }
}
