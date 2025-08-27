import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using Http;
using OpenAPI;

@service(#{ title: "Keiz! Admin API" })
@info(#{
  version: "1.0.0",
  contact: #{
    name: "Keiz!",
    url: "https://ag-keiz.com",
    email: "hq@ag-keiz.com",
  },
  license: #{ name: "All Rights Reserved", url: "https://ag-keiz.com" },
})
namespace KeizAdminAPI;

model AttributeChoice {
  @format("uuid") id: string;
  name: string;
}

model RepairHistory {
  has_repaired: boolean;
  note: string;
}

model Registration {
  /**
   * 車台番号
   */
  chassis_number: string;

  /**
   * 型式
   */
  model_number: string;

  /**
   * 原動機の型式
   */
  engine_model_number: string;

  /**
   * 型式指定番号
   */
  designation_number: string;

  /**
   * 類別区分番号
   */
  classification_number: string;

  /**
   * 運輸支局名: https://www.airia.or.jp/info/number/01.html
   */
  place: string;

  /**
   * 自動車の種別による分類番号
   */
  class_number: string;

  /**
   * かな
   */
  kana: string;

  /**
   * 一連指定番号
   */
  serial_number: string;

  /**
   * 初度登録年月
   */
  first_registered_date: utcDateTime;

  /**
   * 登録年月日/交付年月日
   */
  last_registered_date: utcDateTime;

  /**
   * 有効期限の満了する日
   */
  expiration_date: utcDateTime;
}

model Cost {
  /**
   * 仕入本体価格
   */
  cost_price: uint32;

  /**
   * リサイクル預託金
   */
  recycling_fee: uint32;

  /**
   * 自動車税
   */
  automotive_tax: uint32;

  /**
   * 自動車重量税
   */
  automobile_weight_tax: uint32;

  /**
   * 自動車賠償責任保険料
   */
  automobile_liability_insurance: uint32;
}

model AfterService {
  inspection_record_book: AttributeChoice;
  regular_inspection_and_maintenance: AttributeChoice;
  guarantee: AttributeChoice;
}

model Metadata {
  /**
   * 登録日時
   */
  registered_at: utcDateTime;

  /**
   * 最終更新日時
   */
  last_modified_at: utcDateTime;

  /**
   * 売却日時 (販売中の場合はNULL)
   */
  sold_at?: utcDateTime;
}

model Website {
  /**
   * 備考
   */
  note: string;

  /**
   * ラインナップ表示順序（1からスタート、0はラインナップに表示しない）
   */
  lineup_order: uint32;

  /**
   * おすすめ表示順序（1からスタート、0はおすすめに表示しない）
   */
  recommendation_order: uint32;
}

model Car {
  @format("uuid") id: string;
  manufacturer: AttributeChoice;

  /**
   * 車種名
   */
  brand_name: string;

  /**
   * グレード名
   */
  grade_name: string;

  /**
   * 装備
   */
  accessaries: AttributeChoice[];

  body_type: AttributeChoice;
  color: AttributeChoice;

  /**
   * 乗車定員
   */
  passengers: uint32;

  /**
   * ドア数
   */
  doors: uint32;

  handle_position?: AttributeChoice;

  /**
   * 排気量 (cc)
   */
  displacement: uint32;

  driving_wheels_type: AttributeChoice;
  transmission_type: AttributeChoice;
  fuel_type: AttributeChoice;

  /**
   * Mileage in km
   */
  mileage: uint32;

  repair_history: RepairHistory;
  car_history: AttributeChoice;
  registration: Registration;
  cost: Cost;
  after_service: AfterService;
  metadata: Metadata;
  website: Website;
}

model CreateAfterService {
  @format("uuid") inspection_record_book_id: string;
  @format("uuid") regular_inspection_and_maintenance_id: string;
  @format("uuid") guarantee_id: string;
}

model CreateCar {
  @format("uuid") manufacturer_id: string;
  accessary_ids: string[];
  brand_name: string;
  grade_name: string;
  @format("uuid") body_type_id: string;
  @format("uuid") color_id: string;
  passengers: uint32;
  doors: uint32;
  @format("uuid") handle_position_id?: string;
  displacement: uint32;
  @format("uuid") driving_wheels_type_id: string;
  @format("uuid") transmission_type_id: string;
  @format("uuid") fuel_type_id: string;
  mileage: uint32;
  repair_history?: string;
  @format("uuid") car_history_id: string;
  registration: Registration;
  cost: Cost;
  body_price: uint32;
  after_service: CreateAfterService;
  metadata: Metadata;
  website: Website;
}

model UpdateAfterService {
  @format("uuid") inspection_record_book_id?: string;
  @format("uuid") regular_inspection_and_maintenance_id?: string;
  @format("uuid") guarantee_id?: string;
}

model UpdateCar {
  @format("uuid") manufacturer_id?: string;
  brand_name?: string;
  grade_name?: string;
  accessary_ids?: string[];
  @format("uuid") body_type_id?: string;
  @format("uuid") color_id?: string;
  passengers?: uint32;
  doors?: uint32;
  @format("uuid") handle_position_id?: string;
  displacement?: uint32;
  @format("uuid") driving_wheels_type_id?: string;
  @format("uuid") transmission_type_id?: string;
  @format("uuid") fuel_type_id?: string;
  mileage?: uint32;
  repair_history?: string;
  @format("uuid") car_history_id?: string;
  registration?: Registration;
  cost?: Cost;
  after_service?: UpdateAfterService;
  metadata?: Metadata;
  website?: Website;
}

model Image {
  @format("uuid") id: string;

  /**
   * 表示順序（1からスタート）
   */
  display_order: uint32;

  /**
   * Webサイトに公開するかどうか
   */
  is_public: boolean;
}

model CreateImage {
  display_order: uint32;
  is_public: boolean;
}

model UpdateImage {
  display_order?: uint32;
  is_public?: boolean;
}

model Price {
  @format("uuid") id: string;
  start_from: utcDateTime;
  body_price: uint32;
}

model CreatePrice {
  start_from: utcDateTime;
  body_price: uint32;
}

model UpdatePrice {
  start_from?: utcDateTime;
  body_price?: uint32;
}

model Attribute {
  @format("uuid") id: string;
  name: string;
}

model CreateAttribute {
  name: string;
}

model UpdateAttribute {
  name?: string;
}

model CreateAttributeChoice {
  name: string;
}

model UpdateAttributeChoice {
  name?: string;
}

/**
 * Get cars
 */
@tag("car")
@route("/cars")
@get
@summary("Get Cars")
op getCars(
  /**
   * Filter
   */
  @query(#{ explode: true }) filter?: "lined_up" | "recommended",
): Body<Car[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create a car
 */
@tag("car")
@route("/cars")
@post
@summary("Create Car")
op createCar(@body body: CreateCar): (CreatedResponse &
  Car) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete a car
 */
@tag("car")
@route("/cars/{carId}")
@delete
@summary("Delete Car")
op deleteCar(...Parameters.carId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get a car
 */
@tag("car")
@route("/cars/{carId}")
@get
@summary("Get Car")
op getCar(...Parameters.carId):
  | Car
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update a car
 */
@tag("car")
@route("/cars/{carId}")
@patch
@summary("Update Car")
op updateCar(...Parameters.carId, @body body: UpdateCar):
  | Car
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get images
 */
@tag("image")
@route("/cars/{carId}/images")
@get
@summary("Get Images")
op getImages(...Parameters.carId): Body<Image[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create a image
 */
@tag("image")
@route("/cars/{carId}/images")
@post
@summary("Create Image")
op createImage(...Parameters.carId, @body body: CreateImage): (CreatedResponse &
  Image) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete a image
 */
@tag("image")
@route("/cars/{carId}/images/{imageId}")
@delete
@summary("Delete Image")
op deleteImage(...Parameters.carId, ...Parameters.imageId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get a image
 */
@tag("image")
@route("/cars/{carId}/images/{imageId}")
@get
@summary("Get Image")
op getImage(...Parameters.carId, ...Parameters.imageId):
  | Image
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update a image
 */
@tag("image")
@route("/cars/{carId}/images/{imageId}")
@patch
@summary("Update Image")
op updateImage(
  ...Parameters.carId,
  ...Parameters.imageId,
  @body body: UpdateImage,
):
  | Image
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get prices
 */
@tag("price")
@route("/cars/{carId}/prices")
@get
@summary("Get Pricess")
op getPrices(...Parameters.carId): Body<Price[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create a price
 */
@tag("price")
@route("/cars/{carId}/prices")
@post
@summary("Create Price")
op createPrice(...Parameters.carId, @body body: CreatePrice): (CreatedResponse &
  Price) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete a price
 */
@tag("price")
@route("/cars/{carId}/prices/{priceId}")
@delete
@summary("Delete Price")
op deletePrice(...Parameters.carId, ...Parameters.priceId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get a price
 */
@tag("price")
@route("/cars/{carId}/prices/{priceId}")
@get
@summary("Get Price")
op getPrice(...Parameters.carId, ...Parameters.priceId):
  | Price
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update a price
 */
@tag("price")
@route("/cars/{carId}/prices/{priceId}")
@patch
@summary("Update Price")
op updatePrice(
  ...Parameters.carId,
  ...Parameters.priceId,
  @body body: UpdatePrice,
):
  | Price
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get attributes
 */
@tag("attribute")
@route("/attributes")
@get
@summary("Get Attribute")
op getAttributes(): Body<Attribute[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create an attributes
 */
@tag("attribute")
@route("/attributes")
@post
@summary("Create Attribute")
op createAttribute(@body body: CreateAttribute): (CreatedResponse &
  Attribute) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete an attribute
 */
@tag("attribute")
@route("/attributes/{attributeId}")
@delete
@summary("Delete Attribute")
op deleteAttribute(...Parameters.attributeId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get an attribute
 */
@tag("attribute")
@route("/attributes/{attributeId}")
@get
@summary("Get Attribute")
op getAttribute(...Parameters.attributeId):
  | Attribute
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update an attribute
 */
@tag("attribute")
@route("/attributes/{attributeId}")
@patch
@summary("Update Attribute")
op updateAttribute(...Parameters.attributeId, @body body: UpdateAttribute):
  | Attribute
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get attribute choices
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices")
@get
@summary("Get Attribute Choices")
op getAttributeChoices(
  ...Parameters.attributeId,
): Body<AttributeChoice[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices")
@post
@summary("Create Attribute Choice")
op createAttributeChoice(
  ...Parameters.attributeId,
  @body body: CreateAttributeChoice,
): (CreatedResponse & AttributeChoice) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices/{choiceId}")
@delete
@summary("Delete Attribute Choice")
op deleteAttributeChoice(...Parameters.attributeId, ...Parameters.choiceId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices/{choiceId}")
@get
@summary("Get Attribute Choice")
op getAttributeChoice(...Parameters.attributeId, ...Parameters.choiceId):
  | AttributeChoice
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices/{choiceId}")
@patch
@summary("Update Attribute Choice")
op updateAttributeChoice(
  ...Parameters.attributeId,
  ...Parameters.choiceId,
  @body body: UpdateAttributeChoice,
):
  | AttributeChoice
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

namespace Parameters {
  model carId {
    /**
     * Car ID
     */
    @format("uuid") @path carId: string;
  }
  model imageId {
    /**
     * Image ID
     */
    @format("uuid") @path imageId: string;
  }
  model priceId {
    /**
     * Price ID
     */
    @format("uuid") @path priceId: string;
  }
  model attributeId {
    /**
     * Attribute ID
     */
    @format("uuid") @path attributeId: string;
  }
  model choiceId {
    /**
     * Choice ID
     */
    @format("uuid") @path choiceId: string;
  }
}
