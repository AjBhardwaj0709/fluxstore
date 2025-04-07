import 'package:fluxstore/exports/app_exports.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({Key? key}) : super(key: key);

  @override
  State<MainBanner> createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  int _currentIndex = 0;
  final List<String> _bannerImages = [
    'assets/png/banner1.png',
    'assets/png/banner1.png',
    'assets/png/banner1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: _bannerImages.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_bannerImages[index]),
                  fit: BoxFit.cover,
                  
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 215, // Increase height if text is getting cut off
            autoPlay: true,
            
            viewportFraction: 1.0, // Take full width
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _bannerImages.asMap().entries.map((entry) {
              return Container(
                width: _currentIndex == entry.key ? 16.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: _currentIndex == entry.key
                      ? Colors.black
                      : Colors.black26,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
