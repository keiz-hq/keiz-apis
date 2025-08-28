model RepairHistory {
  has_repaired: boolean;
  note: string;
}

model UpdateRepairHistoryPayload {
  has_repaired?: boolean;
  note?: string;
}
