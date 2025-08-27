model Car {
  id: uuid;

  @doc("メーカー")
  manufacturer: Choice;

  @doc("車種名")
  brand_name: string;

  @doc("グレード名")
  grade_name: string;

  @doc("装備")
  accessaries: Choice[];

  @doc("ボディタイプ")
  body_type: Choice;

  @doc("ボディカラー")
  color: Choice;

  @doc("乗車定員")
  passengers: uint32;

  @doc("ドア数")
  doors: uint32;

  @doc("ハンドル位置")
  handle_position?: Choice;

  @doc("排気量 (cc)")
  displacement: uint32;

  @doc("駆動方式")
  driving_wheels_type: Choice;

  @doc("トランスミッション")
  transmission_type: Choice;

  @doc("燃料")
  fuel_type: Choice;

  @doc("走行距離 (km)")
  mileage: uint32;

  @doc("修復歴")
  repair_history: RepairHistory;

  @doc("車歴")
  car_history: Choice;

  @doc("登録情報")
  registration: Registration;

  @doc("コスト")
  cost: Cost;

  @doc("アフターサービス")
  after_service: AfterService;

  @doc("メタデータ")
  metadata: Metadata;

  @doc("Webサイト情報")
  website: Website;
}

model CreateCar {
  @doc("Choice ID")
  manufacturer_id: uuid;

  @doc("Choice ID")
  accessary_ids: uuid[];

  brand_name: string;
  grade_name: string;

  @doc("Choice ID")
  body_type_id: uuid;

  @doc("Choice ID")
  color_id: uuid;

  passengers: uint32;
  doors: uint32;

  @doc("Choice ID")
  handle_position_id?: uuid;

  displacement: uint32;

  @doc("Choice ID")
  driving_wheels_type_id: uuid;

  @doc("Choice ID")
  transmission_type_id: uuid;

  @doc("Choice ID")
  fuel_type_id: uuid;

  mileage: uint32;
  repair_history?: string;

  @doc("Choice ID")
  car_history_id: uuid;

  registration: Registration;
  cost: Cost;
  body_price: uint32;
  after_service: CreateAfterServicePayload;
  metadata: Metadata;
  website: Website;
}

model UpdateCar {
  @doc("Choice ID")
  manufacturer_id?: uuid;

  brand_name?: string;
  grade_name?: string;

  @doc("Choice ID")
  accessary_ids?: uuid[];

  @doc("Choice ID")
  body_type_id?: uuid;

  @doc("Choice ID")
  color_id?: uuid;

  passengers?: uint32;
  doors?: uint32;

  @doc("Choice ID")
  handle_position_id?: uuid;

  displacement?: uint32;

  @doc("Choice ID")
  driving_wheels_type_id?: uuid;

  @doc("Choice ID")
  transmission_type_id?: uuid;

  @doc("Choice ID")
  fuel_type_id?: uuid;

  mileage?: uint32;
  repair_history?: string;

  @doc("Choice ID")
  car_history_id?: uuid;

  registration?: Registration;
  cost?: Cost;
  after_service?: UpdateAfterServicePayload;
  metadata?: Metadata;
  website?: Website;
}
