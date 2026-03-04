import "../foundation";

using Foundation;

namespace KeizFoundation {
  model Choice {
    id: uuid;

    @doc("Key (snake_case)")
    key: string;

    @doc("表示名")
    display_name_ja: string;
  }

  model CreateChoicePayload {
    @doc("Key (snake_case)")
    key: string;

    @doc("表示名")
    display_name_ja: string;
  }

  model UpdateChoicePayload {
    @doc("Key (snake_case)")
    key?: string;

    @doc("表示名")
    display_name_ja?: string;
  }
}
