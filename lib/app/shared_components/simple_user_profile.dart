import 'package:flutter/material.dart';
import 'package:task_dashboard/app/constant/app_constant.dart';
import 'package:task_dashboard/app/utils/functions.dart';

class SimpleUserProfil extends StatelessWidget {
  const SimpleUserProfil({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildAvatar(),
      title: _buildName(),
      trailing: IconButton(
        splashRadius: 24,
        onPressed: onPressed,
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.orange.withOpacity(.2),
      child: Text(
        getInitials(string: name, limitTo: 2),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: kFontColorPallets[0],
        fontSize: 13,
      ),
    );
  }
}
