import "../foundation";

using Foundation;

namespace KeizFoundation {
  model Attribute {
    id: uuid;

    @doc("Key (snake_case)")
    key: string;

    @doc("表示名")
    display_name_ja: string;

    @doc("選択肢")
    choices: Choice[];
  }

  model CreateAttributePayload {
    @doc("Key (snake_case)")
    key: string;

    @doc("表示名")
    display_name_ja: string;
  }

  model UpdateAttributePayload {
    @doc("Key (snake_case)")
    key?: string;

    @doc("表示名")
    display_name_ja?: string;
  }
}
