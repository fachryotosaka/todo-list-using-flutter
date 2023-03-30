import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  VoidCallback closdDrawer;
  DrawerWidget({super.key, required this.closdDrawer});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {
  final double runanim = 0.4;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Column(
      children: [
        _buildButton(context),
        SizedBox(
          height: he * 0.02,
        ),
        _buidText(context),
        SizedBox(
          height: he * 0.02,
        ),
        buildDrawerItem(context),
        SizedBox(
          height: he * 0.02,
        ),
      ],
    ));
  }

  Widget buildDrawerItem(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: DrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 1),
                    leading: Icon(
                      item.icon,
                      size: 18,
                      color: Colors.white.withOpacity(1),
                    ),
                    title: Text(
                      item.title,
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ))
              .toList(),
        ),
      );
  Widget _buildButton(contex) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: he * 0.11, left: we * 0.15),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: Container(
          width: 47,
          height: 47,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2B2B2B),
          ),
          child: IconButton(
              onPressed: widget.closdDrawer,
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
                size: 20,
              ))),
    );
  }

  Widget _buidText(context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: he * 0.1, right: we * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lexa",
            style: GoogleFonts.inter(
                fontSize: 40,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Otosaka",
            style: GoogleFonts.inter(
                fontSize: 40,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
