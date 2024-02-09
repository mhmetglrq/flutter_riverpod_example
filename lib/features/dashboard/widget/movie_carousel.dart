import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/config/extension/context_extension.dart';
import 'package:flutter_riverpod_example/config/items/app_colors.dart';
import 'package:flutter_riverpod_example/core/constants/api_constants.dart';
import 'package:flutter_riverpod_example/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_riverpod_example/features/models/movie_model.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({
    super.key,
  });

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return FutureBuilder<List<MovieModel>>(
              future: ref
                  .read(dashboardControllerProvider)
                  .getPopularMovies(1, null),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel> popularMovies = snapshot.data!;
                  return Column(
                    children: [
                      SizedBox(
                          height: context.dynamicHeight(0.31),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: context.dynamicHeight(0.31),
                              aspectRatio: 0.7,
                              viewportFraction: 0.5,
                              initialPage: 0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              reverse: false,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                            ),
                            items: popularMovies.map((popularMovie) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 0.5, sigmaY: 0.5),
                                    child: Card(
                                      color: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Container(
                                        height: context.dynamicHeight(0.35),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              ApiConstants.imageUrl +
                                                  popularMovie.posterPath!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primary
                                                  .withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 3,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                          border: Border.all(
                                            color: AppColors.primary,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          )),
                      Padding(
                        padding: context.paddingVerticalLow,
                        child: SizedBox(
                          height: context.dynamicHeight(0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < popularMovies.length; i++)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.dynamicWidth(0.01),
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: context.dynamicHeight(0.01),
                                    width: _currentPage == i
                                        ? context.dynamicWidth(0.09)
                                        : context.dynamicWidth(0.02),
                                    decoration: BoxDecoration(
                                      color: _currentPage == i
                                          ? AppColors.primary
                                          : AppColors.lightGrayColor,
                                      borderRadius: _currentPage == i
                                          ? BorderRadius.circular(5)
                                          : BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Bir hata ile karşılaşıldı!"),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
