part of dashboard;

class _HeaderWeeklyTask extends StatelessWidget {
  const _HeaderWeeklyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        HeaderText(data: "Weekly Task"),
      ],
    );
  }
}
