class BannerItem {
  final String imageUrl;
  final String title;     // Optional overlay title
  final String subtitle;  // Optional overlay subtitle

  BannerItem({
    required this.imageUrl,
    this.title = '',
    this.subtitle = '',
  });
}
