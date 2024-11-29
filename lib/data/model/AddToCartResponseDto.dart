import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      this.statusMsg});

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['status'];
    message = json['message'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class AddDataCartDto extends AddDataCartEntity {
  AddDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDto.fromJson(v));
      });
    }
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductsDto extends AddProductsEntity {
  AddProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
