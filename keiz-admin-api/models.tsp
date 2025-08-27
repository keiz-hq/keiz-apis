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