part of dashboard;

class _TaskInProgress extends StatelessWidget {
  const _TaskInProgress({
    required this.data,
    Key? key,
  }) : super(key: key);

  final List<CardTaskData> data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius * 2),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
            alignment: Alignment.center,
            child: CardTask(
              data: data[index],
              primary: kFontColorPallets[2],
              onPrimary: kFontColorPallets[0],
            ),
          ),
        ),
      ),
    );
  }

  Color _getSequenceColor(int index) {
    int val = index % 4;
    if (val == 3) {
      return Colors.indigo;
    } else if (val == 2) {
      return Colors.grey;
    } else if (val == 1) {
      return Colors.redAccent;
    } else {
      return Colors.lightBlue;
    }
  }
}
