model AttributeChoice {
  @format("uuid") id: string;
  name: string;
}

model Registration {
  /**
   * Year and month of first registration (初度登録年月)
   */
  first_registered_date: utcDateTime;

  /**
   * Expiration date (有効期限の満了する日)
   */
  expiration_date: utcDateTime;
}

model Cost {
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

model Image {
  /**
   * UUID
   */
  id: string;

  /**
   * 表示順序
   */
  display_order: uint32;
}

model Metadata {
  /**
   * 最終更新日時
   */
  last_modified_at: utcDateTime;
}

model Website {
  /**
   * コメント・説明・備考
   */
  comment: string;

  /**
   * Start from 1, default is 0 (which means not on lineup)
   */
  lineup_order: uint32;

  /**
   * Start from 1, default is 0 (which means not recommended)
   */
  recommendation_order: uint32;
}

model Car {
  /**
   * UUID
   */
  id: string;

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

  handle_position: AttributeChoice;

  /**
   * Displacement in cc
   */
  displacement: uint32;

  driving_wheels_type: AttributeChoice;
  transmission_type: AttributeChoice;
  fuel_type: AttributeChoice;

  /**
   * Mileage in km
   */
  mileage: uint32;

  /**
   * Description of repair history, default is empty string (which means no repair history)
   */
  repair_history: string;

  car_history: AttributeChoice;
  registration: Registration;
  cost: Cost;

  /**
   * 本体価格
   */
  body_price?: uint32;

  after_service: AfterService;
  images: Image[];
  metadata: Metadata;
  website: Website;
}