import 'package:flutter/material.dart';
import '../theme/theme.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String size;
  final String imageUrl;
  final bool isNewProject;

  const PropertyCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.size,
    required this.imageUrl,
    this.isNewProject = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radiusM),
                  topRight: Radius.circular(AppDimensions.radiusM),
                ),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        height: 160,
                        color: AppColors.secondaryLight,
                        child: Icon(
                          Icons.home,
                          size: 50,
                          color: AppColors.secondary,
                        ),
                      ),
                ),
              ),
              Positioned(
                top: AppDimensions.paddingS,
                left: AppDimensions.paddingS,
                child:
                    isNewProject
                        ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingS,
                            vertical: AppDimensions.paddingXS,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusS,
                            ),
                          ),
                          child: Text(
                            'NEW LAUNCH',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textOnSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingS,
                            vertical: AppDimensions.paddingXS,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusS,
                            ),
                          ),
                          child: Text(
                            'FEATURED',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textOnPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
              ),
              Positioned(
                top: AppDimensions.paddingS,
                right: AppDimensions.paddingS,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, size: 20),
                    color: AppColors.primary,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: AppTextStyles.h3.copyWith(color: AppColors.primary),
                ),
                SizedBox(height: AppDimensions.paddingXS),
                Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppDimensions.paddingXS),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: AppDimensions.iconS,
                      color: AppColors.textOnSecondary,
                    ),
                    SizedBox(width: AppDimensions.paddingXS),
                    Expanded(
                      child: Text(
                        location,
                        style: AppTextStyles.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.paddingS),
                Row(
                  children: [
                    Icon(
                      Icons.square_foot_outlined,
                      size: AppDimensions.iconS,
                      color: AppColors.textOnSecondary,
                    ),
                    SizedBox(width: AppDimensions.paddingXS),
                    Text(size, style: AppTextStyles.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
