import 'package:fluxstore/exports/app_exports.dart';

Widget buildCategoryIcons() {
  final categories = [
    {
      'icon': "assets/svg/men_t_shirt_logo.svg",
      'label': 'Men',
      'bg color': '#ecfcfc',
    },
    {
      'icon': "assets/svg/women_dress_logo.svg",
      'label': 'Women',
      'bg color': '#e8e8fc',
    },
    {
      'icon': "assets/svg/shorts_logo.svg",
      'label': 'Clothing',
      'bg color': '#ecf4f4',
    },
    {
      'icon': "assets/svg/posters_logo.svg",
      'label': 'Posters',
      'bg color': '#ececf4',
    },
    {
      'icon': "assets/svg/music_logo.svg",
      'label': 'Music',
      'bg color': '#e9ebee',
    },
  ];

  return Padding(
    padding: EdgeInsets.zero,
    child: SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final category = categories[index];
          final iconPath = category['icon'] as String;
          final label = category['label'] as String;
          final bgColorHex = category['bg color'] as String;
    
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
            
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: HexColor(bgColorHex),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
