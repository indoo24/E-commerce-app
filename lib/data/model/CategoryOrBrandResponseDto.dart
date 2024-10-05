import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';

class CategoryOrBrandResponseDto extends CategoryOrBrandResponseEnitity {
  CategoryOrBrandResponseDto({
    super.results,
    super.metadata,
    super.data,
    this.statusMsg,
    this.message,
  });

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class CategoryOrBrandDto extends CategoryOrBrandEntity {
  CategoryOrBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class Metadata extends MetadataEntity {
  Metadata({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
