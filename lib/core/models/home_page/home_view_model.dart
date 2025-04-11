import 'dart:async';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  late PageController pageController;
  int currentPage = 0;
  late Timer timer;

  HomeViewModel() {
    pageController = PageController(viewportFraction: 0.8);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  void fetchUserData() {
    // Your fetch data logic here
  }
  List watchoRecommendationsList = [
    {
      "title": 'Anupama',
      'subTitle': '2024 · Action',
    },
    {
      "title": 'My Contracted Husband',
      'subTitle': '2024 · Drama',
    },
    {
      "title": 'Flash',
      'subTitle': '2023 · Action',
    },
    {
      "title": 'Noshtoneer',
      'subTitle': '2022 · Thriller',
    },
    {
      "title": 'Shrimad Ramayan',
      'subTitle': '2023 · Devotional',
    },
  ];

  List playboxRecommendationsList = [
    {
      "title": 'Brinda (Hindi)',
      'subTitle': '2024 · Action',
    },
    {
      "title": 'Rinki ko Mobile',
      'subTitle': '2024 · Drama',
    },
    {
      "title": 'Tanaav 2',
      'subTitle': '2023 · Drama',
    },
    {
      "title": 'Gullak 4',
      'subTitle': '2022 · Drama',
    },
    {
      "title": 'State V/S Ahuja ',
      'subTitle': '2023 · Comedy',
    },
  ];

  List topLiveTVShowsList = [
    {
      "title": 'Live Stream 99',
      'subTitle': 'News Nine',
    },
    {
      "title": 'Budget 2024 Live',
      'subTitle': 'News Nation',
    },
    {
      "title": 'Live 24/7',
      'subTitle': 'News 18 India',
    },
    {
      "title": 'Lakh ki Baat',
      'subTitle': 'News Nation',
    },
    {
      "title": 'Live Fatafat News',
      'subTitle': 'News 18 India',
    },
  ];

  List catchYourFavouriteTVShowsList = [
    {
      "title": 'Anupama',
      'subTitle': 'Star Plus',
    },
    {
      "title": 'Sath Nibhana Sathiya',
      'subTitle': 'Star Plus',
    },
    {
      "title": 'Yeh Rishta Kya Kehlata hai',
      'subTitle': 'Star Plus',
    },
    {
      "title": 'Taarak Mehta ka ooltah Chasmah',
      'subTitle': 'Sony Sab TV',
    },
    {
      "title": 'Dori - Riston ki',
      'subTitle': 'Colors Tv',
    },
  ];

  List trendingVideosList = [
    {
      "title": 'Make Perfect Thumbnail',
      'subTitle': 'Social Factory',
    },
    {
      "title": 'Taste of Toxicity',
      'subTitle': 'Krish Ashok',
    },
    {
      "title": 'Facts & Science behind food',
      'subTitle': 'Krish Ashok',
    },
    {
      "title": 'The Game Called Life',
      'subTitle': 'Aevy TV',
    },
    {
      "title": 'Home Olympics',
      'subTitle': 'Triggered Insaan ',
    },
  ];

  List topSongsAcrossIndiaList = [
    {
      "title": 'Mein Tera Ho Gya',
      'subTitle': 'Yasser Desai',
    },
    {
      "title": 'Barish - Slow & Reverb',
      'subTitle': 'Atif Aslam',
    },
    {
      "title": 'Dard Tere ',
      'subTitle': 'Ishan Khan & Shambhavi Thakur',
    },
    {
      "title": 'Hum Nashe Mein Toh Nahin',
      'subTitle': 'Arijit Singh',
    },
    {
      "title": 'Kinni Soni',
      'subTitle': 'Darshan Raval',
    },
  ];
}
