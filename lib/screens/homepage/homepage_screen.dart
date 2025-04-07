import 'package:fluxstore/exports/app_exports.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
       // ✅ Ensures full white background
      appBar: PreferredSize(
         preferredSize: const Size.fromHeight(80),
        child: AppBar(
          
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/logo.png', height: 45),
              const SizedBox(width: 8),
              const Text("Fluxstore", style: TextStyle(color: Colors.black,fontSize: 30)),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // ✅ Makes body background white
        height:
            MediaQuery.of(context).size.height -
            kToolbarHeight -
            MediaQuery.of(context).padding.top -
            70, // adjust for nav bar height
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategoryIcons(),
              const SizedBox(height: 5),
              MainBanner(),
              const SizedBox(height: 10),
              buildPromoSections(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
         top: false,
        child: Container(
          color: Colors.white, // ✅ Ensures nav bar is pure white
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() => _selectedIndex = index);
            },
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.white, // ✅ Match scaffold background
            color: Colors.grey[600],
            activeColor: Colors.blue,
            tabBackgroundColor: Colors.grey.shade200,
            rippleColor: Colors.transparent, // optional: remove ripple
            hoverColor: Colors.transparent, // optional: remove hover
            tabs: [
              const GButton(icon: Icons.home, text: 'Shop'),
              const GButton(icon: Icons.search, text: 'Search'),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: 'Cart',
                iconActiveColor: Colors.blue,
                leading: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_bag_outlined, size: 24),
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
