import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupDropdown extends StatefulWidget {
  @override
  _GroupDropdownState createState() => _GroupDropdownState();
}

class _GroupDropdownState extends State<GroupDropdown> {
  String? _selectedGroup;

  final List<Map<String, dynamic>> _groups = [
    {
      'label': 'Home',
      'icon': 'assets/icons/home.svg',
      'color': Color(0xFFFF69B4), // pink
    },
    {
      'label': 'Personal',
      'icon': 'assets/icons/personal.svg',
      'color': Color(0xFF149954), // green
    },
    {
      'label': 'Work',
      'icon': 'assets/icons/work.svg',
      'color': Colors.black,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedGroup,
      onChanged: (value) {
        setState(() {
          _selectedGroup = value;
        });
      },
      decoration: InputDecoration(
        labelText: 'Group',labelStyle: TextStyle(fontFamily: AppFonts.mainFont,fontSize: 14.sp, fontWeight: FontWeight.w200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: _groups.map((group) {
        return DropdownMenuItem<String>(
          value: group['label'],
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: group['color'],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SvgPicture.asset(
                  group['icon'],
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(group['label']),
            ],
          ),
        );
      }).toList(),
    );
  }
}
