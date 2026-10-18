/// ロスター一覧の並び替え対象（GET /api/v1/rosters の sort_by）
/// enum 名をそのままクエリの値として送る
enum RosterSortBy { rating, number, experience, name }

/// 並び替え順（GET /api/v1/rosters の sort_order）
/// enum 名をそのままクエリの値として送る
enum SortOrder { asc, desc }
