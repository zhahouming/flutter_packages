part of '../ezplayer.dart';

class SeekingOverlay extends StatelessWidget {
  final String newPositionTime;
  final String totalTime;
  const SeekingOverlay({
    Key? key,
    required this.newPositionTime,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          newPositionTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          ' / $totalTime',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ).div(DivStyle(backgroundColor: Colors.black26));
  }
}
