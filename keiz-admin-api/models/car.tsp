model Car {
  id: uuid;

  @doc("メーカー")
  manufacturer: Choice;

  @doc("車種名")
  brand_name: string;

  @doc("グレード名")
  grade_name: string;

  @doc("ボディタイプ")
  body_type: Choice;

  @doc("ボディカラー")
  color: Choice;

  @doc("乗車定員")
  passengers: uint32;

  @doc("ドア数")
  doors: uint32;

  @doc("ハンドル位置")
  handle_position: Choice;

  @doc("排気量 (cc)")
  displacement: uint32;

  @doc("駆動方式")
  driving_wheels_type: Choice;

  @doc("トランスミッション")
  transmission_type: Choice;

  @doc("燃料")
  fuel_type: Choice;

  @doc("装備")
  accessaries: Choice[];

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

  @doc("価格")
  prices: Price[];

  @doc("画像")
  images: Image[];

  @doc("アフターサービス")
  after_service: AfterService;

  @doc("Webサイト情報")
  website: Website;

  @doc("メタデータ")
  metadata: Metadata;
}

model CreateCar {
  @doc("メーカー; Choice ID")
  manufacturer_id: uuid;

  @doc("車種名")
  brand_name: string;

  @doc("グレード名")
  grade_name: string;

  @doc("ボディタイプ; Choice ID")
  body_type_id: uuid;

  @doc("ボディカラー; Choice ID")
  color_id: uuid;

  @doc("乗車定員")
  passengers: uint32;

  @doc("ドア数")
  doors: uint32;

  @doc("ハンドル位置; Choice ID")
  handle_position_id: uuid;

  @doc("排気量 (cc)")
  displacement: uint32;

  @doc("駆動方式; Choice ID")
  driving_wheels_type_id: uuid;

  @doc("トランスミッション; Choice ID")
  transmission_type_id: uuid;

  @doc("燃料; Choice ID")
  fuel_type_id: uuid;

  @doc("装備; Choice IDs")
  accessary_ids: uuid[];

  @doc("走行距離 (km)")
  mileage: uint32;

  @doc("修復歴")
  repair_history: RepairHistory;

  @doc("車歴; Choice ID")
  car_history_id: uuid;

  @doc("登録情報")
  registration: Registration;

  @doc("コスト")
  cost: Cost;

  @doc("価格")
  price: CreatePricePayload;

  @doc("アフターサービス")
  after_service: CreateAfterServicePayload;

  @doc("Webサイト情報")
  website: Website;
}

model UpdateCar {
  @doc("メーカー; Choice ID")
  manufacturer_id?: uuid;

  @doc("車種名")
  brand_name?: string;

  @doc("グレード名")
  grade_name?: string;

  @doc("ボディタイプ; Choice ID")
  body_type_id?: uuid;

  @doc("ボディカラー; Choice ID")
  color_id?: uuid;

  @doc("乗車定員")
  passengers?: uint32;

  @doc("ドア数")
  doors?: uint32;

  @doc("ハンドル位置; Choice ID")
  handle_position_id?: uuid;

  @doc("排気量 (cc)")
  displacement?: uint32;

  @doc("駆動方式; Choice ID")
  driving_wheels_type_id?: uuid;

  @doc("トランスミッション; Choice ID")
  transmission_type_id?: uuid;

  @doc("燃料; Choice ID")
  fuel_type_id?: uuid;

  @doc("装備; Choice IDs")
  accessary_ids?: uuid[];

  @doc("走行距離 (km)")
  mileage?: uint32;

  @doc("修復歴")
  repair_history?: UpdateRepairHistoryPayload;

  @doc("車歴; Choice ID")
  car_history_id?: uuid;

  @doc("登録情報")
  registration?: UpdateRegistrationPayload;

  @doc("コスト")
  cost?: UpdateCostPayload;

  @doc("アフターサービス")
  after_service?: UpdateAfterServicePayload;

  @doc("Webサイト情報")
  website?: UpdateWebsitePayload;
}
