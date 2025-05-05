import 'package:flutter/material.dart';

import '../../../../../core/constants/my_colors.dart';

class FavoriteIconButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const FavoriteIconButton({
    Key? key,
    this.initialValue = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialValue;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? MyColors.primaryColor : Colors.black,
        ),
        onPressed: _toggleFavorite,
      ),
    );
  }
}
