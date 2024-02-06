import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/config/extension/context_extension.dart';
import 'package:flutter_riverpod_example/config/items/app_colors.dart';
import 'package:flutter_riverpod_example/config/utility/enum/image_constants.dart';
import 'package:flutter_riverpod_example/features/dashboard/widget/movie_carousel.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/aligned_title.dart';
import '../widget/introduction_area.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            top: context.dynamicHeight(0.02),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IntroductionArea(
                      name: "OMER",
                    ),
                    InkWell(
                      child: Card(
                        elevation: 5,
                        color: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: context.paddingAllLow,
                          child: SvgPicture.asset(
                            ImageConstants.bell.getSvg,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: context.paddingVerticalDefault,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.lightGrayColor,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.lightGrayColor,
                      ),
                      suffixIcon: const Icon(
                        Icons.mic,
                        color: AppColors.lightGrayColor,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.grayColor,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                const AlignedTitle(
                  title: 'Running in Screen',
                  alignment: Alignment.centerLeft,
                ),
                const MovieCarousel(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AlignedTitle(
                        title: "Movie Categories", alignment: Alignment.center),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.lightGrayColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.dynamicHeight(0.06),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          surfaceTintColor: AppColors.primary,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: AppColors.primary,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.dynamicWidth(0.03),
                              vertical: context.dynamicHeight(0.01),
                            ),
                            child: Text(
                              "Category $index",
                              style: context.textTheme.labelMedium?.copyWith(
                                fontSize: context.dynamicHeight(0.02),
                                color: AppColors.darkGrayColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AlignedTitle(
                        title: "Upcoming Movies", alignment: Alignment.center),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.lightGrayColor,
                        ),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.amber,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/en/2/28/Doom_Cover.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
