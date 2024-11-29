import 'package:ecommerce_app/data/model/CategoryOrBrandResponseDto.dart';
import 'package:ecommerce_app/data/model/ProductResponseDto.dart';

import '../../domain/entities/GetWichlistResponseEntity.dart';

class GetWishListResponseDto extends GetWishListResponseEntity {
  GetWishListResponseDto({
    super.status,
    super.count,
    super.data,
    this.statusMsg,
    this.message,
  });

  GetWishListResponseDto.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WishListProductDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class WishListProductDto extends WishListProductEntity {
  WishListProductDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  WishListProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryOrBrandDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}
