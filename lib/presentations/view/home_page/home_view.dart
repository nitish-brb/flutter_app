import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/dimension_constants.dart';
import '../../../core/constants/icon_constants.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/constants/string_constants.dart';
import '../../../core/helper/size_helper.dart';
import '../../../core/models/home_page/home_view_model.dart';
import '../../../core/utils/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.fetchUserData();
      },
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: AppBar(
          backgroundColor: ColorConstants.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: Dimensions.px20),
            child: Image.asset(
              ImageConstants.fastwayIcon,
              height: Dimensions.px64,
              width: Dimensions.px88,
            ),
          ),
          actions: [
            Row(
              children: [
                SvgPicture.asset(
                  IconConstants.exploreIcon,
                  height: Dimensions.px24,
                  width: Dimensions.px24,
                ),
                SizeHelper.w1(),
                Text(
                  StringConstants.explore,
                  style: AppTextStyles.mediumText(fontSize: Dimensions.px16),
                ),
                SizeHelper.w2(),
                Container(
                  height: Dimensions.px36,
                  width: Dimensions.px36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ColorConstants.shadedGrey,
                      width: Dimensions.px1,
                    ),
                    borderRadius: BorderRadius.circular(Dimensions.px24),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: Dimensions.px20,
                      color: ColorConstants.black,
                    ),
                    onPressed: () {
                      // Define search action
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: Dimensions.px24,
                    color: ColorConstants.black,
                  ),
                  onPressed: () {
                    // Define menu action
                  },
                ),
                SizeHelper.w2(),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.px200,
                child: PageView.builder(
                  controller: viewModel.pageController,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: viewModel.pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (viewModel.pageController.position.haveDimensions) {
                          value = viewModel.pageController.page! - index;
                          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                        }
                        return Center(
                          child: SizedBox(
                            height: Curves.easeOut.transform(value) *
                                Dimensions.px186,
                            width: Curves.easeOut.transform(value) *
                                Dimensions.px327,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.px5),
                              child: Image.asset(
                                [
                                  ImageConstants.anupmaImage,
                                  ImageConstants.saregamapaImage,
                                  ImageConstants.mainterahogyaImage,
                                  ImageConstants.anupmaImage,
                                  ImageConstants.saregamapaImage,
                                  ImageConstants.mainterahogyaImage,
                                  ImageConstants.anupmaImage,
                                  ImageConstants.saregamapaImage,
                                  ImageConstants.mainterahogyaImage,
                                ][index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizeHelper.h2(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimensions.px20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConstants.apps,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px0),
                            child: Image.asset(
                              ImageConstants.appImage,
                              height: Dimensions.px112,
                              width: Dimensions.px111,
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.liveTVChannels,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px0),
                            child: Image.asset(
                              ImageConstants.channelImage,
                              height: Dimensions.px90,
                              width: Dimensions.px160,
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.freeLiveTVChannels,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px0),
                            child: Image.asset(
                              ImageConstants.channelImage2,
                              height: Dimensions.px90,
                              width: Dimensions.px160,
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.watchoRecommendations,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: viewModel.watchoRecommendationsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.saregamapaImage,
                                  height: Dimensions.px90,
                                  width: Dimensions.px160,
                                ),
                                SizeHelper.h05(),
                                Text(
                                  "${viewModel.watchoRecommendationsList[index]['title']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px12),
                                ),
                                Text(
                                  "${viewModel.watchoRecommendationsList[index]['subTitle']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px10,
                                      color: ColorConstants.silverChalice),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.playboxRecommendations,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: viewModel.playboxRecommendationsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.saregamapaImage,
                                  height: Dimensions.px90,
                                  width: Dimensions.px160,
                                ),
                                SizeHelper.h05(),
                                Text(
                                  "${viewModel.playboxRecommendationsList[index]['title']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px12),
                                ),
                                Text(
                                  "${viewModel.playboxRecommendationsList[index]['subTitle']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px10,
                                      color: ColorConstants.silverChalice),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.topLiveTVShows,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: viewModel.topLiveTVShowsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.saregamapaImage,
                                  height: Dimensions.px90,
                                  width: Dimensions.px160,
                                ),
                                SizeHelper.h05(),
                                Text(
                                  "${viewModel.topLiveTVShowsList[index]['title']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px12),
                                ),
                                Text(
                                  "${viewModel.topLiveTVShowsList[index]['subTitle']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px10,
                                      color: ColorConstants.silverChalice),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.catchYourFavouriteTVShows,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount:
                            viewModel.catchYourFavouriteTVShowsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.anupmaImage,
                                  height: Dimensions.px90,
                                  width: Dimensions.px160,
                                ),
                                SizeHelper.h05(),
                                Text(
                                  "${viewModel.catchYourFavouriteTVShowsList[index]['title']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px12),
                                ),
                                Text(
                                  "${viewModel.catchYourFavouriteTVShowsList[index]['subTitle']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px10,
                                      color: ColorConstants.silverChalice),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.trendingVideos,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: viewModel.trendingVideosList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.saregamapaImage,
                                  height: Dimensions.px90,
                                  width: Dimensions.px160,
                                ),
                                SizeHelper.h05(),
                                Text(
                                  "${viewModel.trendingVideosList[index]['title']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px12),
                                ),
                                Text(
                                  "${viewModel.trendingVideosList[index]['subTitle']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px10,
                                      color: ColorConstants.silverChalice),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h1(),
                    Text(StringConstants.topSongsAcrossIndia,
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px14)),
                    SizedBox(
                      height: Dimensions.px150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(Dimensions.px10),
                        itemCount: viewModel.topSongsAcrossIndiaList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: Dimensions.px10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.saregamapaImage,
                                  height: Dimensions.px90,
                                  width: Dimensions.px160,
                                ),
                                SizeHelper.h05(),
                                Text(
                                  "${viewModel.topSongsAcrossIndiaList[index]['title']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px12),
                                ),
                                Text(
                                  "${viewModel.topSongsAcrossIndiaList[index]['subTitle']}",
                                  style: AppTextStyles.mediumText(
                                      fontSize: Dimensions.px10,
                                      color: ColorConstants.silverChalice),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Dimensions.px57,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      ColorConstants.funBlue,
                      ColorConstants.ceriseRed,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      StringConstants.allRightsReserved,
                      style: AppTextStyles.mediumText(
                        fontSize: Dimensions.px14,
                        color: ColorConstants.white,
                      ),
                    ),
                    SizeHelper.w2(),
                    SvgPicture.asset(IconConstants.facebookIcon),
                    SvgPicture.asset(IconConstants.twitterIcon),
                    SvgPicture.asset(IconConstants.linkedinIcon),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
