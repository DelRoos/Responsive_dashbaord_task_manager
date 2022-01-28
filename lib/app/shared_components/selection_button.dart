import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dashboard/app/constant/app_constant.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({
    Key? key,
    this.initialSelected = 0,
    required this.data,
    required this.onSelected,
  }) : super(key: key);

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map(
        (e) {
          final index = e.key;
          final data = e.value;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: _Button(
                selected: selected == index,
                data: data,
                onPressed: () {
                  widget.onSelected(index, data);
                  setState(() {
                    selected = index;
                  });
                }),
          );
        },
      ).toList(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.selected,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          (!selected) ? null : Theme.of(context).primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              _buildIcon(),
              const SizedBox(width: kSpacing / 2),
              Expanded(child: _buildLabel()),
              Padding(
                padding: const EdgeInsets.only(left: kSpacing / 2),
                child: _buildNotifs(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      (!selected) ? data.icon : data.activeIcon,
      size: 20,
      color: (!selected)
          ? kFontColorPallets[1]
          : Theme.of(Get.context!).primaryColor,
    );
  }

  Widget _buildLabel() {
    return Text(
      data.label,
      style: TextStyle(
        color: (!selected)
            ? kFontColorPallets[1]
            : Theme.of(Get.context!).primaryColor,
        fontWeight: FontWeight.bold,
        // letterSpacing: 4,
        fontSize: 14,
      ),
    );
  }

  Widget _buildNotifs() {
    return (data.totalNotif == null || data.totalNotif! <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              (data.totalNotif! >= 100) ? "99+" : "${data.totalNotif!}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
