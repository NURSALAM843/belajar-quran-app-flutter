// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:belajar_lutter/screens/globals.dart';
import 'package:belajar_lutter/tabs/hijb_tab.dart';
import 'package:belajar_lutter/tabs/page_tab.dart';
import 'package:belajar_lutter/tabs/para_tab.dart';
import 'package:belajar_lutter/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _greeting(),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      backgroundColor: background,
                      automaticallyImplyLeading: false,
                      shape: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: const Color(0xFFAAAAAA).withOpacity(.1))),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: _tabBar(),
                      ),
                    )
                  ],
              body: const TabBarView(
                  children: [SurahTab(), ParaTab(), PageTab(), HijbTab()])),
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
        unselectedLabelColor: text,
        labelColor: Colors.white,
        indicatorColor: primary,
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Surah"),
          _tabItem(label: "Para"),
          _tabItem(label: "Page"),
          _tabItem(label: "Hijb"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamualaikum",
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: text),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "NUR SALAM",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead(),
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    .6,
                    1
                  ],
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFFB070FD),
                    Color(0xFF9055FF)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/quran.svg')),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "last Read",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Al-Fatihah",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Ayat No : 1",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar() => AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false, //hilangin arrow back di appbar
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/svgs/menu-icon.svg')),
            const SizedBox(
              width: 24,
            ),
            Text(
              "Quran App",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
          ],
        ),
      );
}

BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: navigation,
      showSelectedLabels: false, //untuk menghilangkan labelnya
      showUnselectedLabels: false, //untuk menghilangkan labelnya
      items: [
        _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
        _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
        _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
        _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
        _bottomBarItem(
            icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
      ],
    );

BottomNavigationBarItem _bottomBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, color: text),
        activeIcon: SvgPicture.asset(icon, color: primary),
        label: label);
