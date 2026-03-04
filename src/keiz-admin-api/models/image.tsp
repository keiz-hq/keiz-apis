import "../../foundation";

using Foundation;

namespace KeizAdminAPI {
  model Image {
    id: uuid;

    @doc("表示順序（1からスタート）")
    display_order: uint32;

    @doc("Webサイトに公開するかどうか")
    is_public: boolean;
  }

  model CreateImagePayload {
    display_order: uint32;
    is_public: boolean;
  }

  model UpdateImagePayload {
    display_order?: uint32;
    is_public?: boolean;
  }
}
