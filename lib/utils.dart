String getCountSummaryText(int views) {
  if (views < 1000) {
    return "$views";
  }
  if (views < 1000000) {
    return "${(views ~/ 1000)}K";
  }
  return "${(views ~/ 1000000)}M";
}
