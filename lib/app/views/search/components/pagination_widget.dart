import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Function(int) onPageSelected;
  final Color primaryColor;
  final TextTheme textTheme;

  const PaginationWidget({
    Key? key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageSelected,
    required this.primaryColor,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentPage > 0)
          _buildPageButton(
            icon: Icons.navigate_before,
            onTap: () => onPageSelected(currentPage - 1),
          ),

        _buildPageNumber(0),

        if (currentPage > 2) _buildEllipsis(),

        for (int i = currentPage - 1; i <= currentPage + 1; i++)
          if (i > 0 && i < totalPages - 1) _buildPageNumber(i),

        if (currentPage < totalPages - 3) _buildEllipsis(),

        if (totalPages > 1) _buildPageNumber(totalPages - 1),

        if (currentPage < totalPages - 1)
          _buildPageButton(
            icon: Icons.navigate_next,
            onTap: () => onPageSelected(currentPage + 1),
          ),

      ],
    );
  }

  Widget _buildPageButton(
      {required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(225, 225, 225, 1.0),
        ),
      ),
      child: InkWell(
        child: Icon(icon),
        onTap: onTap,
      ),
    );
  }

  Widget _buildPageNumber(int index) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : null,
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(225, 225, 225, 1.0),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: () => onPageSelected(index),
        child: Center(
          child: Text(
            (index + 1).toString(),
            style: currentPage == index
                ? textTheme.displaySmall
                : textTheme.bodySmall,
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis() {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(225, 225, 225, 1.0),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      alignment: Alignment.center,
      child: Text("•••", style: textTheme.bodySmall?.copyWith(fontSize: 22)),
    );
  }
}
