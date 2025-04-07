import 'package:fluxstore/exports/app_exports.dart';

Widget buildPromoSections() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        SizedBox(
          height: 200,
          child: Image.asset(
            'assets/png/hangout_banner.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _promoCard(
                "assets/png/men_style.png",
                "T-Shirts",
                "THE OFFICE LIFE",
                isImageLeft: true,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _promoCard(
                "assets/png/women_style.png",
                "Dress",
                "ELEGANT DESIGN",
                isImageLeft: false,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget _promoCard(
  String image,
  String title,
  String subtitle, {
  bool isImageLeft = true,
}) {
  return SizedBox(
    height: 170, // keep card height
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4FC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // 🔥 Removed padding to let content fill entire height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // matches parent container
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment
                  .stretch, // 🔥 Forces children to take full height
          children:
              isImageLeft
                  ? [
                    _buildImage(image),
                    const SizedBox(width: 10),
                    _buildText(title, subtitle),
                  ]
                  : [
                    _buildText(title, subtitle),
                    const SizedBox(width: 10),
                    _buildImage(image),
                  ],
        ),
      ),
    ),
  );
}

Widget _buildImage(String image) {
  return SizedBox(
    width: 100,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
      height: double.infinity, // 🔥 Take full available height
    ),
  );
}




Widget _buildText(String title, String subtitle) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    ),
  );
}
