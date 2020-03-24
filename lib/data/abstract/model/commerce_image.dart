class CommerceImage {
  final int id;
  final String address;

  final String altText;
  final bool isLocal;

  CommerceImage(this.id, this.address, this.altText, {this.isLocal = false});

  CommerceImage.placeHolder()
      : this(0, 'assets/placeholder.png', 'no image', isLocal: true);
}
