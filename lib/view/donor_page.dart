import 'package:flutter/material.dart';
import 'search_page.dart';
import '../../helper/const.dart';
import '../../widgets.dart';
class DonorScreen extends StatelessWidget {
  const DonorScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> donationScreens=[const DonationImportantScreen(),const DonationRequirementScreen(),
    const DonationProcessScreen(),const AfterDonationScreen()];
    return DefaultTabController(
      length:donationScreens.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: [
            Tab(text: 'اهمية التبرع',),
            Tab(text: 'شروط التبرع',),
            Tab(text: 'عملية التبرع',),
                Tab(text: 'ما بعد التبرع',),

          ]),
        ),
        body:Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.06,
                      image: AssetImage('assets/images/ghaith_icon.jpg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            TabBarView(children: [
              donationScreens[0],
              donationScreens[1],
              donationScreens[2],
              donationScreens[3],
            ]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: main1Color,
          onPressed: (){
          AppHelper(context).navigate(const SearchScreen());
        },
        child: const Icon(Icons.search,color: Colors.white,),
        ),
      ),
    );
  }
}
class DonationImportantScreen extends StatelessWidget {
  const DonationImportantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(
        child: AppText('اهمية التبرع'),
      ),
    );
  }
}
class DonationRequirementScreen extends StatelessWidget {
  const DonationRequirementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(
        child: AppText('شروط التبرع'),
      ),
    );
  }
}
class DonationProcessScreen extends StatelessWidget {
  const DonationProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(
        child: AppText('معلومات عن عملية التبرع'),
      ),
    );
  }
}
class DonationRestrictionScreen extends StatelessWidget {
  const DonationRestrictionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(
        child: AppText('موانع التبرع'),
      ),
    );
  }
}
class AfterDonationScreen extends StatelessWidget {
  const AfterDonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(
        child: AppText('ماذا بعد التبرع'),
      ),
    );
  }
}

