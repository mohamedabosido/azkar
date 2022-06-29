import 'package:azkar/constants.dart';
import 'package:azkar/models/SubCategorey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageIndexProvider =
    StateProvider.family<int, int>((ref, index) => 0);

class PrayersDetailsScreen extends ConsumerWidget {
  PrayersDetailsScreen(
    this.subCategory, {
    Key? key,
    required this.index,
  }) : super(key: key);
  final SubCategory subCategory;

  final int index;

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(currentPageIndexProvider(index));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryTextColor,
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: currentPageIndex != 0
                    ? () {
                        if (currentPageIndex > 0) {
                          pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      }
                    : null,
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      'الدعاء السابق',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryTextColor,
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: currentPageIndex + 1 != subCategory.prayers.length
                    ? () {
                        if (currentPageIndex < subCategory.prayers.length - 1) {
                          pageController.animateToPage(currentPageIndex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      }
                    : null,
                child: Row(
                  children: const [
                    Text(
                      'الدعاء التالي',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            subCategory.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          flexibleSpace: const Image(
            image: AssetImage('images/back.png'),
            fit: BoxFit.cover,
          ),
          elevation: 0,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (int value) {
            ref.read(currentPageIndexProvider(index).notifier).state = value;
          },
          children: List.generate(
            subCategory.prayers.length,
            (index) => ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      'الدعاء ${index + 1} من ${subCategory.prayers.length} دعاء',
                      style: const TextStyle(
                          color: purpleColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    boxShadow: const [
                      BoxShadow(
                        color: backgroundColor,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red.shade900,
                                  child: Center(
                                    child: Text(
                                      subCategory.prayers[index].times
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '${subCategory.prayers[index].times} مرات',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subCategory.prayers[index].title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'هنا يوضع السند او المصدر سواء كان من القرآن او من الحديث,',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: purpleColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
