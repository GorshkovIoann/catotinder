import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/cat_model.dart';
import '../services/cat_service.dart';
import '../widgets/like_button.dart';
import '../widgets/dislike_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CatService catService = CatService();
  Cat? currentCat;
  int likeCounter = 0;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadNewCat();
  }

  Future<void> loadNewCat() async {
    int attempts = 0;
    Cat? cat;
    // Попробуем загрузить данные не более 3 раз
    while (attempts < 3 && cat == null) {
      cat = await catService.fetchRandomCat();
      attempts++;
    }
    if (cat != null) {
      setState(() {
        currentCat = cat;
        errorMessage = null;
      });
    } else {
      setState(() {
        errorMessage = 'Не удалось загрузить данные. Попробуйте позже.';
      });
    }
  }

  void onSwipe(bool liked) {
    if (liked) {
      setState(() {
        likeCounter++;
      });
    }
    loadNewCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Tinder')),
      body:
          errorMessage != null
              ? Center(child: Text(errorMessage!))
              : currentCat == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity != null) {
                        if (details.primaryVelocity! > 0) {
                          onSwipe(true);
                        } else {
                          onSwipe(false);
                        }
                      }
                    },
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: currentCat,
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: currentCat!.url,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentCat!.breedName,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LikeButton(onPressed: () => onSwipe(true)),
                      const SizedBox(width: 20),
                      DislikeButton(onPressed: () => onSwipe(false)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Likes: $likeCounter',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
    );
  }
}
