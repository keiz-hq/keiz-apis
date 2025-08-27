model AfterService {
  @doc("点検記録簿")
  inspection_record_book: Choice;

  @doc("定期点検整備")
  regular_inspection_and_maintenance: Choice;

  @doc("保証")
  guarantee: Choice;
}
