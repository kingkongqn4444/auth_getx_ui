import 'package:base_flutter_app/theme/theme.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/material.dart';

class ContainerGender extends StatefulWidget {
  final String? initValue;
  final Function(String)? onChanged;

   const ContainerGender({Key? key, this.initValue, this.onChanged}) : super(key: key);

  @override
  State<ContainerGender> createState() => _ContainerGenderState();
}

class _ContainerGenderState extends State<ContainerGender> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    if (widget.initValue != null) {
      _tabController = TabController(
          length: _data.length,
          vsync: this,
          initialIndex: _data.indexWhere((element) => element == widget.initValue));
    } else {
      _tabController = TabController(length: _data.length, vsync: this);
    }

    super.initState();
  }

  final _data = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(4),
          width: double.infinity,
          height: 45,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), color: AssetColors.greyF2F2F2),
          child: TabBar(
            controller: _tabController,
            tabs: _data.map((e) => Tab(text: e)).toList(),
            labelColor: AssetColors.black44350D,
            unselectedLabelColor: AssetColors.black44350D0p32,
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
            onTap: (index) {
              widget.onChanged?.call(_data[index]);
            },
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Gender', style: Get.textTheme.subtitle2!.textBlack44350D0p6),
            ],
          ),
        )
      ],
    );
  }
}
